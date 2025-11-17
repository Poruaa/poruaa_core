import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/storage/model/storage_models.dart';
import 'package:poruaa_core/data/services/storage/r2_storage_service.dart';
import 'package:poruaa_core/utils/result.dart';

class R2StorageServiceImpl implements R2StorageService {
  final AuthorizedApiService _apiService;

  R2StorageServiceImpl({required AuthorizedApiService apiService})
    : _apiService = apiService;

  @override
  Future<Result<ListFilesResponse>> listFiles(
    int teacherId, {
    String? path,
    String? continuationToken,
    int? maxKeys,
  }) async {
    try {
      // Build query parameters
      final queryParams = <String, String>{};
      if (path != null && path.isNotEmpty) {
        queryParams['path'] = path;
      }
      if (continuationToken != null && continuationToken.isNotEmpty) {
        queryParams['continuation_token'] = continuationToken;
      }
      if (maxKeys != null) {
        queryParams['max_keys'] = maxKeys.toString();
      }

      // Build URL with query parameters
      var url = 'teachers/$teacherId/storage/list';
      if (queryParams.isNotEmpty) {
        final query = queryParams.entries
            .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
            .join('&');
        url = '$url?$query';
      }

      final response = await _apiService.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err('Failed to list files: ${response.value.statusCode}');
          }
          final jsonData = json.decode(response.value.body);
          final listResponse = ListFilesResponse.fromJson(jsonData);
          return Ok(listResponse);
        case Err():
          return Err('Failed to list files: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<UploadUrlResponse>> generateUploadUrl(
    int teacherId,
    UploadUrlRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        'teachers/$teacherId/storage/upload-url',
        body: json.encode(request.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err(
              'Failed to generate upload URL: ${response.value.statusCode}',
            );
          }
          final jsonData = json.decode(response.value.body);
          final uploadResponse = UploadUrlResponse.fromJson(jsonData);
          return Ok(uploadResponse);
        case Err():
          return Err('Failed to generate upload URL: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<CreateFolderResponse>> createFolder(
    int teacherId,
    CreateFolderRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        'teachers/$teacherId/storage/folder',
        body: json.encode(request.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err('Failed to create folder: ${response.value.statusCode}');
          }
          final jsonData = json.decode(response.value.body);
          final folderResponse = CreateFolderResponse.fromJson(jsonData);
          return Ok(folderResponse);
        case Err():
          return Err('Failed to create folder: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<DeleteResponse>> delete(
    int teacherId,
    DeleteRequest request,
  ) async {
    try {
      final response = await _apiService.delete(
        'teachers/$teacherId/storage',
        body: json.encode(request.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err('Failed to delete: ${response.value.statusCode}');
          }
          final jsonData = json.decode(response.value.body);
          final deleteResponse = DeleteResponse.fromJson(jsonData);
          return Ok(deleteResponse);
        case Err():
          return Err('Failed to delete: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<FileMetadata>> getFileMetadata(
    int teacherId,
    String filePath,
  ) async {
    try {
      final response = await _apiService.get(
        'teachers/$teacherId/storage/metadata/$filePath',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err(
              'Failed to get file metadata: ${response.value.statusCode}',
            );
          }
          final jsonData = json.decode(response.value.body);
          final metadata = FileMetadata.fromJson(jsonData);
          return Ok(metadata);
        case Err():
          return Err('Failed to get file metadata: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<DownloadUrlResponse>> generateDownloadUrl(
    int teacherId,
    DownloadUrlRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        'teachers/$teacherId/storage/download-url',
        body: json.encode(request.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Err(
              'Failed to generate download URL: ${response.value.statusCode}',
            );
          }
          final jsonData = json.decode(response.value.body);
          final downloadResponse = DownloadUrlResponse.fromJson(jsonData);
          return Ok(downloadResponse);
        case Err():
          return Err('Failed to generate download URL: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }
}
