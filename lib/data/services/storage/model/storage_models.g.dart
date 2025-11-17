// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageItem _$StorageItemFromJson(Map<String, dynamic> json) => StorageItem(
  name: json['name'] as String,
  path: json['path'] as String,
  isFolder: json['is_folder'] as bool,
  size: (json['size'] as num?)?.toInt(),
  lastModified: json['last_modified'] == null
      ? null
      : DateTime.parse(json['last_modified'] as String),
  contentType: json['content_type'] as String?,
);

Map<String, dynamic> _$StorageItemToJson(StorageItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'is_folder': instance.isFolder,
      'size': instance.size,
      'last_modified': instance.lastModified?.toIso8601String(),
      'content_type': instance.contentType,
    };

ListFilesResponse _$ListFilesResponseFromJson(Map<String, dynamic> json) =>
    ListFilesResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => StorageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['folders'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      continuationToken: json['continuation_token'] as String?,
      currentPrefix: json['current_prefix'] as String,
    );

Map<String, dynamic> _$ListFilesResponseToJson(ListFilesResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'folders': instance.folders,
      'continuation_token': instance.continuationToken,
      'current_prefix': instance.currentPrefix,
    };

UploadUrlRequest _$UploadUrlRequestFromJson(Map<String, dynamic> json) =>
    UploadUrlRequest(
      filePath: json['file_path'] as String,
      contentType: json['content_type'] as String?,
      expiresInSeconds: (json['expires_in_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadUrlRequestToJson(UploadUrlRequest instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
      'content_type': instance.contentType,
      'expires_in_seconds': instance.expiresInSeconds,
    };

UploadUrlResponse _$UploadUrlResponseFromJson(Map<String, dynamic> json) =>
    UploadUrlResponse(
      uploadUrl: json['upload_url'] as String,
      filePath: json['file_path'] as String,
      publicUrl: json['public_url'] as String,
      expiresInSeconds: (json['expires_in_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$UploadUrlResponseToJson(UploadUrlResponse instance) =>
    <String, dynamic>{
      'upload_url': instance.uploadUrl,
      'file_path': instance.filePath,
      'public_url': instance.publicUrl,
      'expires_in_seconds': instance.expiresInSeconds,
    };

CreateFolderRequest _$CreateFolderRequestFromJson(Map<String, dynamic> json) =>
    CreateFolderRequest(folderPath: json['folder_path'] as String);

Map<String, dynamic> _$CreateFolderRequestToJson(
  CreateFolderRequest instance,
) => <String, dynamic>{'folder_path': instance.folderPath};

CreateFolderResponse _$CreateFolderResponseFromJson(
  Map<String, dynamic> json,
) => CreateFolderResponse(
  success: json['success'] as bool,
  folderPath: json['folder_path'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$CreateFolderResponseToJson(
  CreateFolderResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'folder_path': instance.folderPath,
  'message': instance.message,
};

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) =>
    DeleteRequest(
      path: json['path'] as String,
      recursive: json['recursive'] as bool?,
    );

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{'path': instance.path, 'recursive': instance.recursive};

DeleteResponse _$DeleteResponseFromJson(Map<String, dynamic> json) =>
    DeleteResponse(
      success: json['success'] as bool,
      deletedCount: (json['deleted_count'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteResponseToJson(DeleteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'deleted_count': instance.deletedCount,
      'message': instance.message,
    };

FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) => FileMetadata(
  path: json['path'] as String,
  size: (json['size'] as num).toInt(),
  contentType: json['content_type'] as String,
  lastModified: DateTime.parse(json['last_modified'] as String),
  etag: json['etag'] as String,
);

Map<String, dynamic> _$FileMetadataToJson(FileMetadata instance) =>
    <String, dynamic>{
      'path': instance.path,
      'size': instance.size,
      'content_type': instance.contentType,
      'last_modified': instance.lastModified.toIso8601String(),
      'etag': instance.etag,
    };

DownloadUrlRequest _$DownloadUrlRequestFromJson(Map<String, dynamic> json) =>
    DownloadUrlRequest(
      filePath: json['file_path'] as String,
      expiresInSeconds: (json['expires_in_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DownloadUrlRequestToJson(DownloadUrlRequest instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
      'expires_in_seconds': instance.expiresInSeconds,
    };

DownloadUrlResponse _$DownloadUrlResponseFromJson(Map<String, dynamic> json) =>
    DownloadUrlResponse(
      downloadUrl: json['download_url'] as String,
      expiresInSeconds: (json['expires_in_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$DownloadUrlResponseToJson(
  DownloadUrlResponse instance,
) => <String, dynamic>{
  'download_url': instance.downloadUrl,
  'expires_in_seconds': instance.expiresInSeconds,
};
