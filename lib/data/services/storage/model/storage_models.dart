import 'package:json_annotation/json_annotation.dart';

part 'storage_models.g.dart';

/// Represents a file or folder in storage
@JsonSerializable(fieldRename: FieldRename.snake)
class StorageItem {
  final String name;
  final String path;
  final bool isFolder;
  final int? size;
  final DateTime? lastModified;
  final String? contentType;

  StorageItem({
    required this.name,
    required this.path,
    required this.isFolder,
    this.size,
    this.lastModified,
    this.contentType,
  });

  factory StorageItem.fromJson(Map<String, dynamic> json) =>
      _$StorageItemFromJson(json);

  Map<String, dynamic> toJson() => _$StorageItemToJson(this);
}

/// Response from listing files and folders
@JsonSerializable(fieldRename: FieldRename.snake)
class ListFilesResponse {
  final List<StorageItem> items;
  final List<String> folders;
  final String? continuationToken;
  final String currentPrefix;

  ListFilesResponse({
    required this.items,
    required this.folders,
    this.continuationToken,
    required this.currentPrefix,
  });

  factory ListFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFilesResponseToJson(this);
}

/// Request to generate upload URL
@JsonSerializable(fieldRename: FieldRename.snake)
class UploadUrlRequest {
  final String filePath;
  final String? contentType;
  final int? expiresInSeconds;

  UploadUrlRequest({
    required this.filePath,
    this.contentType,
    this.expiresInSeconds,
  });

  factory UploadUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadUrlRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UploadUrlRequestToJson(this);
}

/// Response with upload URL
@JsonSerializable(fieldRename: FieldRename.snake)
class UploadUrlResponse {
  final String uploadUrl;
  final String filePath;
  final String publicUrl;
  final int expiresInSeconds;

  UploadUrlResponse({
    required this.uploadUrl,
    required this.filePath,
    required this.publicUrl,
    required this.expiresInSeconds,
  });

  factory UploadUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadUrlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadUrlResponseToJson(this);
}

/// Request to create a folder
@JsonSerializable(fieldRename: FieldRename.snake)
class CreateFolderRequest {
  final String folderPath;

  CreateFolderRequest({required this.folderPath});

  factory CreateFolderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFolderRequestToJson(this);
}

/// Response from creating a folder
@JsonSerializable(fieldRename: FieldRename.snake)
class CreateFolderResponse {
  final bool success;
  final String folderPath;
  final String message;

  CreateFolderResponse({
    required this.success,
    required this.folderPath,
    required this.message,
  });

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFolderResponseToJson(this);
}

/// Request to delete a file or folder
@JsonSerializable(fieldRename: FieldRename.snake)
class DeleteRequest {
  final String path;
  final bool? recursive;

  DeleteRequest({required this.path, this.recursive});

  factory DeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRequestToJson(this);
}

/// Response from deleting a file or folder
@JsonSerializable(fieldRename: FieldRename.snake)
class DeleteResponse {
  final bool success;
  final int deletedCount;
  final String message;

  DeleteResponse({
    required this.success,
    required this.deletedCount,
    required this.message,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteResponseToJson(this);
}

/// File metadata
@JsonSerializable(fieldRename: FieldRename.snake)
class FileMetadata {
  final String path;
  final int size;
  final String contentType;
  final DateTime lastModified;
  final String etag;

  FileMetadata({
    required this.path,
    required this.size,
    required this.contentType,
    required this.lastModified,
    required this.etag,
  });

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FileMetadataToJson(this);
}

/// Request to generate download URL
@JsonSerializable(fieldRename: FieldRename.snake)
class DownloadUrlRequest {
  final String filePath;
  final int? expiresInSeconds;

  DownloadUrlRequest({required this.filePath, this.expiresInSeconds});

  factory DownloadUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$DownloadUrlRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadUrlRequestToJson(this);
}

/// Response with download URL
@JsonSerializable(fieldRename: FieldRename.snake)
class DownloadUrlResponse {
  final String downloadUrl;
  final int expiresInSeconds;

  DownloadUrlResponse({
    required this.downloadUrl,
    required this.expiresInSeconds,
  });

  factory DownloadUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$DownloadUrlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadUrlResponseToJson(this);
}

/// Request to recompute file size
@JsonSerializable(fieldRename: FieldRename.snake)
class RecomputeFileSizeRequest {
  final String filePath;

  RecomputeFileSizeRequest({required this.filePath});

  factory RecomputeFileSizeRequest.fromJson(Map<String, dynamic> json) =>
      _$RecomputeFileSizeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RecomputeFileSizeRequestToJson(this);
}

/// Response from recomputing file size
@JsonSerializable(fieldRename: FieldRename.snake)
class RecomputeFileSizeResponse {
  final bool success;
  final String filePath;
  final int sizeBytes;
  final String? contentType;
  final String? etag;
  final String message;

  RecomputeFileSizeResponse({
    required this.success,
    required this.filePath,
    required this.sizeBytes,
    this.contentType,
    this.etag,
    required this.message,
  });

  factory RecomputeFileSizeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecomputeFileSizeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecomputeFileSizeResponseToJson(this);
}
