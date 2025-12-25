import 'package:poruaa_core/data/repositories/storage/storage_repository.dart';
import 'package:poruaa_core/data/services/storage/model/storage_models.dart';
import 'package:poruaa_core/data/services/storage/r2_storage_service.dart';
import 'package:poruaa_core/utils/app_loger.dart';
import 'package:poruaa_core/utils/result.dart';

class StorageRepositoryImpl implements StorageRepository {
  final R2StorageService _storageService;

  StorageRepositoryImpl({required R2StorageService storageService})
    : _storageService = storageService;

  @override
  Future<Result<ListFilesResponse>> listFiles(
    int teacherId, {
    String? path,
    String? continuationToken,
    int? maxKeys,
  }) async {
    try {
      final result = await _storageService.listFiles(
        teacherId,
        path: path,
        continuationToken: continuationToken,
        maxKeys: maxKeys,
      );

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Listed files successfully",
            params: {
              "teacherId": teacherId,
              "path": path,
              "itemCount": result.value.items.length,
            },
          );
          return result;
        case Err():
          AppLogger.error("Failed to list files", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error listing files", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<UploadUrlResponse>> generateUploadUrl(
    int teacherId, {
    required String filePath,
    String? contentType,
    int? expiresInSeconds,
  }) async {
    try {
      final request = UploadUrlRequest(
        filePath: filePath,
        contentType: contentType,
        expiresInSeconds: expiresInSeconds,
      );

      final result = await _storageService.generateUploadUrl(
        teacherId,
        request,
      );

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Generated upload URL",
            params: {
              "teacherId": teacherId,
              "filePath": filePath,
              "publicUrl": result.value.publicUrl,
            },
          );
          return result;
        case Err():
          AppLogger.error("Failed to generate upload URL", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error generating upload URL", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<CreateFolderResponse>> createFolder(
    int teacherId,
    String folderPath,
  ) async {
    try {
      final request = CreateFolderRequest(folderPath: folderPath);

      final result = await _storageService.createFolder(teacherId, request);

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Created folder",
            params: {"teacherId": teacherId, "folderPath": folderPath},
          );
          return result;
        case Err():
          AppLogger.error("Failed to create folder", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error creating folder", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<DeleteResponse>> deleteFile(
    int teacherId,
    String path, {
    bool recursive = false,
  }) async {
    try {
      final request = DeleteRequest(path: path, recursive: recursive);

      final result = await _storageService.delete(teacherId, request);

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Deleted file/folder",
            params: {
              "teacherId": teacherId,
              "path": path,
              "recursive": recursive,
              "deletedCount": result.value.deletedCount,
            },
          );
          return result;
        case Err():
          AppLogger.error("Failed to delete", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error deleting", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<FileMetadata>> getFileMetadata(
    int teacherId,
    String filePath,
  ) async {
    try {
      final result = await _storageService.getFileMetadata(teacherId, filePath);

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Retrieved file metadata",
            params: {
              "teacherId": teacherId,
              "filePath": filePath,
              "size": result.value.size,
            },
          );
          return result;
        case Err():
          AppLogger.error("Failed to get file metadata", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error getting file metadata", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<DownloadUrlResponse>> generateDownloadUrl(
    int teacherId, {
    required String filePath,
    int? expiresInSeconds,
  }) async {
    try {
      final request = DownloadUrlRequest(
        filePath: filePath,
        expiresInSeconds: expiresInSeconds,
      );

      final result = await _storageService.generateDownloadUrl(
        teacherId,
        request,
      );

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Generated download URL",
            params: {"teacherId": teacherId, "filePath": filePath},
          );
          return result;
        case Err():
          AppLogger.error(
            "Failed to generate download URL",
            error: result.error,
          );
          return result;
      }
    } catch (e) {
      AppLogger.error("Error generating download URL", error: e);
      return Err(e.toString());
    }
  }

  @override
  Future<Result<RecomputeFileSizeResponse>> recomputeFileSize(
    int teacherId,
    String filePath,
  ) async {
    try {
      final request = RecomputeFileSizeRequest(filePath: filePath);

      final result = await _storageService.recomputeFileSize(
        teacherId,
        request,
      );

      switch (result) {
        case Ok():
          AppLogger.debug(
            "Recomputed file size",
            params: {
              "teacherId": teacherId,
              "filePath": filePath,
              "sizeBytes": result.value.sizeBytes,
            },
          );
          return result;
        case Err():
          AppLogger.error("Failed to recompute file size", error: result.error);
          return result;
      }
    } catch (e) {
      AppLogger.error("Error recomputing file size", error: e);
      return Err(e.toString());
    }
  }
}
