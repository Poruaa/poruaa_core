import 'package:poruaa_core/data/services/storage/model/storage_models.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class R2StorageService {
  /// List files and folders in a specific path
  Future<Result<ListFilesResponse>> listFiles(
    int teacherId, {
    String? path,
    String? continuationToken,
    int? maxKeys,
  });

  /// Generate a presigned URL for uploading a file
  Future<Result<UploadUrlResponse>> generateUploadUrl(
    int teacherId,
    UploadUrlRequest request,
  );

  /// Create a new folder
  Future<Result<CreateFolderResponse>> createFolder(
    int teacherId,
    CreateFolderRequest request,
  );

  /// Delete a file or folder
  Future<Result<DeleteResponse>> delete(int teacherId, DeleteRequest request);

  /// Get file metadata
  Future<Result<FileMetadata>> getFileMetadata(int teacherId, String filePath);

  /// Generate a presigned URL for downloading a file
  Future<Result<DownloadUrlResponse>> generateDownloadUrl(
    int teacherId,
    DownloadUrlRequest request,
  );
}
