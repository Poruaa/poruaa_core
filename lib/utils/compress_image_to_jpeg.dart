import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:mime/mime.dart';

Future<Uint8List?> compressImageToJpeg(
  Uint8List imageBytes, {
  int minQuality = 30,
  int targetSizeKB = 100,
  int maxWidth = 1280, // Fixed max width
}) async {
  final targetSizeBytes = targetSizeKB * 1024;

  final mimeType = lookupMimeType('', headerBytes: imageBytes);
  if (mimeType == null || !mimeType.startsWith('image/')) return null;

  if ((mimeType == 'image/webp' || mimeType == 'image/jpeg') &&
      imageBytes.length < targetSizeBytes) {
    return imageBytes;
  }

  final image = img.decodeImage(imageBytes);
  if (image == null) return null;

  // --- Step 1: Center crop to 16:9 ---
  const targetAspect = 16 / 9;
  int cropWidth = image.width;
  int cropHeight = (cropWidth / targetAspect).round();

  if (cropHeight > image.height) {
    cropHeight = image.height;
    cropWidth = (cropHeight * targetAspect).round();
  }

  final offsetX = ((image.width - cropWidth) / 2).round().abs();
  final offsetY = ((image.height - cropHeight) / 2).round().abs();

  final cropped = img.copyCrop(
    image,
    x: offsetX,
    y: offsetY,
    width: cropWidth,
    height: cropHeight,
  );

  final croppedBytes = Uint8List.fromList(
    img.encodeJpg(cropped, quality: 100),
  );
  if (croppedBytes.length <= targetSizeBytes) {
    return croppedBytes;
  }

  maxWidth = min(maxWidth, cropped.width);

  // --- Step 2: Resize to fixed max width (keeping 16:9) ---
  final resized = img.copyResize(
    cropped,
    width: maxWidth,
    height: (maxWidth / targetAspect).round(),
    interpolation: img.Interpolation.cubic,
  );

  // --- Step 3: Compress to JPEG under target size ---
  for (int quality = 80; quality >= minQuality; quality -= 10) {
    final jpegBytes = Uint8List.fromList(
      img.encodeJpg(resized, quality: quality),
    );
    if (jpegBytes.length <= targetSizeBytes) {
      return jpegBytes;
    }
  }

  return null;
}
