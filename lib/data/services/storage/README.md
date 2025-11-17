# R2 Storage Service Documentation

## Overview

The R2 Storage Service provides a complete Dart/Flutter wrapper for managing files and folders in Cloudflare R2 storage. This service enables teachers to upload, download, organize, and manage their files through a clean, type-safe API.

## Architecture

```
┌─────────────────────────────────────────┐
│         Application Layer               │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│    StorageRepository (Repository Layer) │
│  - Simplified API                       │
│  - Logging & Error Handling             │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│  R2StorageService (Service Layer)       │
│  - Direct API Communication             │
│  - JSON Serialization                   │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│      Cloudflare R2 Storage API          │
└─────────────────────────────────────────┘
```

## File Structure

```
lib/data/
├── services/storage/
│   ├── model/
│   │   ├── storage_models.dart          # All DTOs
│   │   └── storage_models.g.dart        # Generated JSON code
│   ├── r2_storage_service.dart          # Service interface
│   ├── r2_storage_service_impl.dart     # Service implementation
│   └── README.md                         # This file
└── repositories/storage/
    ├── storage_repository.dart           # Repository interface
    └── storage_repository_impl.dart      # Repository implementation
```

## Setup & Initialization

### 1. Add Dependencies

Ensure your `pubspec.yaml` includes:

```yaml
dependencies:
  json_annotation: ^4.8.0
  
dev_dependencies:
  build_runner: ^2.4.0
  json_serializable: ^6.7.0
```

### 2. Initialize Service

```dart
import 'package:poruaa_core/data/services/storage/r2_storage_service_impl.dart';
import 'package:poruaa_core/data/repositories/storage/storage_repository_impl.dart';

// Initialize the service
final r2StorageService = R2StorageServiceImpl(
  apiService: authorizedApiService,
);

// Initialize the repository
final storageRepository = StorageRepositoryImpl(
  storageService: r2StorageService,
);
```

## API Reference

### StorageRepository Methods

#### 1. List Files and Folders

List all files and folders in a specific path with pagination support.

```dart
Future<Result<ListFilesResponse>> listFiles(
  int teacherId, {
  String? path,
  String? continuationToken,
  int? maxKeys,
});
```

**Example:**

```dart
final result = await storageRepository.listFiles(
  teacherId,
  path: 'images/',
  maxKeys: 100,
);

switch (result) {
  case Ok(:final value):
    for (var item in value.items) {
      if (item.isFolder) {
        print('📁 Folder: ${item.name}');
      } else {
        print('📄 File: ${item.name} (${item.size} bytes)');
      }
    }
  case Err(:final error):
    print('Error: $error');
}
```

#### 2. Generate Upload URL

Generate a presigned URL for uploading files directly to R2.

```dart
Future<Result<UploadUrlResponse>> generateUploadUrl(
  int teacherId, {
  required String filePath,
  String? contentType,
  int? expiresInSeconds,
});
```

**Example:**

```dart
final result = await storageRepository.generateUploadUrl(
  teacherId,
  filePath: 'documents/report.pdf',
  contentType: 'application/pdf',
  expiresInSeconds: 3600,
);

if (result case Ok(:final value)) {
  // Upload file to presigned URL
  final response = await http.put(
    Uri.parse(value.uploadUrl),
    headers: {'Content-Type': 'application/pdf'},
    body: fileBytes,
  );
  
  if (response.statusCode == 200) {
    print('File uploaded! Available at: ${value.publicUrl}');
  }
}
```

#### 3. Create Folder

Create a new folder in the storage.

```dart
Future<Result<CreateFolderResponse>> createFolder(
  int teacherId,
  String folderPath,
);
```

**Example:**

```dart
final result = await storageRepository.createFolder(
  teacherId,
  'documents/2025/reports',
);

if (result case Ok(:final value)) {
  print('Folder created: ${value.folderPath}');
}
```

#### 4. Delete File or Folder

Delete a file or folder with optional recursive deletion.

```dart
Future<Result<DeleteResponse>> deleteFile(
  int teacherId,
  String path, {
  bool recursive = false,
});
```

**Example:**

```dart
// Delete a single file
final result = await storageRepository.deleteFile(
  teacherId,
  'images/old-photo.jpg',
);

// Delete folder with all contents
final result = await storageRepository.deleteFile(
  teacherId,
  'temp/',
  recursive: true,
);

if (result case Ok(:final value)) {
  print('Deleted ${value.deletedCount} items');
}
```

#### 5. Get File Metadata

Retrieve detailed metadata for a specific file.

```dart
Future<Result<FileMetadata>> getFileMetadata(
  int teacherId,
  String filePath,
);
```

**Example:**

```dart
final result = await storageRepository.getFileMetadata(
  teacherId,
  'images/photo.jpg',
);

if (result case Ok(:final value)) {
  print('File: ${value.path}');
  print('Size: ${value.size} bytes');
  print('Type: ${value.contentType}');
  print('Modified: ${value.lastModified}');
  print('ETag: ${value.etag}');
}
```

#### 6. Generate Download URL

Generate a presigned URL for downloading a file.

```dart
Future<Result<DownloadUrlResponse>> generateDownloadUrl(
  int teacherId, {
  required String filePath,
  int? expiresInSeconds,
});
```

**Example:**

```dart
final result = await storageRepository.generateDownloadUrl(
  teacherId,
  filePath: 'documents/report.pdf',
  expiresInSeconds: 1800,
);

if (result case Ok(:final value)) {
  print('Download URL: ${value.downloadUrl}');
  print('Expires in: ${value.expiresInSeconds} seconds');
  
  // Use the URL to download the file
  launchUrl(Uri.parse(value.downloadUrl));
}
```

## Data Models

### StorageItem

Represents a file or folder in storage.

```dart
class StorageItem {
  final String name;           // File/folder name
  final String path;           // Full path
  final bool isFolder;         // Is this a folder?
  final int? size;             // Size in bytes (null for folders)
  final DateTime? lastModified; // Last modification date
  final String? contentType;   // MIME type (null for folders)
}
```

### ListFilesResponse

Response from listing files operation.

```dart
class ListFilesResponse {
  final List<StorageItem> items;      // Files and folders
  final List<String> folders;         // List of folder names
  final String? continuationToken;    // Token for next page
  final String currentPrefix;         // Current path
}
```

### UploadUrlResponse

Response from generate upload URL operation.

```dart
class UploadUrlResponse {
  final String uploadUrl;         // Presigned upload URL
  final String filePath;          // File path in storage
  final String publicUrl;         // Public CDN URL after upload
  final int expiresInSeconds;     // URL expiration time
}
```

### FileMetadata

Detailed file metadata.

```dart
class FileMetadata {
  final String path;              // File path
  final int size;                 // File size in bytes
  final String contentType;       // MIME type
  final DateTime lastModified;    // Last modification date
  final String etag;              // Entity tag for caching
}
```

## Complete Usage Examples

### Example 1: Upload File Workflow

```dart
// Step 1: Generate upload URL
final uploadUrlResult = await storageRepository.generateUploadUrl(
  teacherId,
  filePath: 'images/profile-photo.jpg',
  contentType: 'image/jpeg',
  expiresInSeconds: 3600,
);

if (uploadUrlResult case Ok(:final uploadData)) {
  // Step 2: Pick file from device
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  
  if (result != null) {
    final file = result.files.first;
    
    // Step 3: Upload to R2 using presigned URL
    final uploadResponse = await http.put(
      Uri.parse(uploadData.uploadUrl),
      headers: {'Content-Type': 'image/jpeg'},
      body: file.bytes,
    );
    
    if (uploadResponse.statusCode == 200) {
      // Step 4: File is now available at public URL
      print('✅ Upload successful!');
      print('📍 File URL: ${uploadData.publicUrl}');
      
      // Step 5: Save the public URL to your database
      await updateUserProfileImage(uploadData.publicUrl);
    }
  }
}
```

### Example 2: Browse and Display Files

```dart
Future<void> displayFiles(int teacherId, String path) async {
  final result = await storageRepository.listFiles(
    teacherId,
    path: path,
    maxKeys: 50,
  );

  if (result case Ok(:final data)) {
    print('\n📂 Contents of /$path');
    print('─' * 50);
    
    // Display folders first
    for (var folder in data.folders) {
      print('📁 $folder/');
    }
    
    // Display files
    for (var item in data.items) {
      if (!item.isFolder) {
        final sizeKB = (item.size ?? 0) / 1024;
        print('📄 ${item.name} (${sizeKB.toStringAsFixed(2)} KB)');
      }
    }
    
    // Handle pagination
    if (data.continuationToken != null) {
      print('\n... More files available');
    }
  }
}
```

### Example 3: File Manager with Delete

```dart
class FileManager {
  final StorageRepository _repository;
  final int teacherId;

  FileManager(this._repository, this.teacherId);

  Future<void> deleteMultipleFiles(List<String> filePaths) async {
    for (var path in filePaths) {
      final result = await _repository.deleteFile(teacherId, path);
      
      switch (result) {
        case Ok(:final value):
          print('✅ Deleted: $path (${value.deletedCount} items)');
        case Err(:final error):
          print('❌ Failed to delete $path: $error');
      }
    }
  }

  Future<void> cleanupOldFiles(String folderPath, Duration age) async {
    final result = await _repository.listFiles(teacherId, path: folderPath);
    
    if (result case Ok(:final data)) {
      final cutoffDate = DateTime.now().subtract(age);
      
      for (var item in data.items) {
        if (item.lastModified != null && 
            item.lastModified!.isBefore(cutoffDate)) {
          await _repository.deleteFile(teacherId, item.path);
          print('🗑️ Deleted old file: ${item.name}');
        }
      }
    }
  }

  Future<void> createOrganizedFolders() async {
    final folders = [
      'images/profile',
      'images/content',
      'documents/reports',
      'documents/invoices',
      'videos/lessons',
    ];

    for (var folder in folders) {
      await _repository.createFolder(teacherId, folder);
      print('📁 Created: $folder');
    }
  }
}
```

### Example 4: Image Upload with Compression

```dart
Future<String?> uploadCompressedImage(
  StorageRepository repository,
  int teacherId,
  File imageFile,
) async {
  try {
    // Compress image before upload
    final compressedBytes = await compressImageToJpeg(imageFile);
    
    // Generate unique filename
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final filename = 'images/profile_$timestamp.jpg';
    
    // Get upload URL
    final urlResult = await repository.generateUploadUrl(
      teacherId,
      filePath: filename,
      contentType: 'image/jpeg',
    );
    
    if (urlResult case Ok(:final value)) {
      // Upload compressed image
      final response = await http.put(
        Uri.parse(value.uploadUrl),
        headers: {'Content-Type': 'image/jpeg'},
        body: compressedBytes,
      );
      
      if (response.statusCode == 200) {
        return value.publicUrl; // Return public URL
      }
    }
    
    return null;
  } catch (e) {
    print('Upload failed: $e');
    return null;
  }
}
```

## Error Handling

All methods return a `Result<T>` type which can be either `Ok(value)` or `Err(error)`.

### Pattern Matching (Recommended)

```dart
final result = await storageRepository.listFiles(teacherId);

switch (result) {
  case Ok(:final value):
    // Success - use value
    print('Found ${value.items.length} items');
  case Err(:final error):
    // Error - handle error
    print('Error: $error');
}
```

### If-Case Syntax

```dart
if (result case Ok(:final value)) {
  // Success path
  processFiles(value.items);
} else if (result case Err(:final error)) {
  // Error path
  showError(error);
}
```

### Traditional Syntax

```dart
if (result.isOk) {
  final data = result.value;
  // Use data
} else {
  final error = result.error;
  // Handle error
}
```

## Storage Structure

Files are organized by teacher and environment:

**Production:**
```
bucket: poruaa-assets
└── teachers/
    └── {teacher_id}/
        ├── images/
        ├── documents/
        └── videos/
```

**Development:**
```
bucket: poruaa-assets
└── dev-teachers/
    └── {teacher_id}/
        ├── images/
        ├── documents/
        └── videos/
```

## Security Features

1. **Teacher Isolation**: Each teacher has their own isolated storage namespace
2. **Path Traversal Prevention**: `..` in paths is automatically rejected
3. **Presigned URLs**: Time-limited URLs for secure upload/download
4. **Authentication**: All requests require valid teacher authentication
5. **Automatic Expiration**: Upload/download URLs expire after specified time

## Best Practices

### 1. Content Types

Always specify content type when uploading:

```dart
final contentTypes = {
  '.jpg': 'image/jpeg',
  '.png': 'image/png',
  '.pdf': 'application/pdf',
  '.mp4': 'video/mp4',
  '.txt': 'text/plain',
};
```

### 2. File Organization

Organize files in logical folder structures:

```dart
// Good
'images/profile/avatar.jpg'
'documents/2025/reports/january.pdf'
'videos/lessons/chapter-1.mp4'

// Bad
'file1.jpg'
'doc.pdf'
'video.mp4'
```

### 3. Error Handling

Always handle errors gracefully:

```dart
final result = await storageRepository.uploadFile(...);

if (result case Err(:final error)) {
  // Log error for debugging
  AppLogger.error('Upload failed', error: error);
  
  // Show user-friendly message
  showSnackbar('Failed to upload file. Please try again.');
  
  // Retry logic if appropriate
  await retryUpload();
}
```

### 4. File Validation

Validate files before uploading:

```dart
Future<bool> validateFile(PlatformFile file) async {
  // Check file size (e.g., max 10MB)
  if (file.size > 10 * 1024 * 1024) {
    showError('File too large. Maximum size is 10MB');
    return false;
  }
  
  // Check file type
  final allowedTypes = ['jpg', 'jpeg', 'png', 'pdf'];
  final extension = file.extension?.toLowerCase();
  
  if (extension == null || !allowedTypes.contains(extension)) {
    showError('Invalid file type. Allowed: ${allowedTypes.join(', ')}');
    return false;
  }
  
  return true;
}
```

### 5. Progress Tracking

For large files, implement progress tracking:

```dart
Future<void> uploadWithProgress(
  String uploadUrl,
  Uint8List fileBytes,
  Function(double) onProgress,
) async {
  final request = http.StreamedRequest('PUT', Uri.parse(uploadUrl));
  request.headers['Content-Type'] = 'image/jpeg';
  request.contentLength = fileBytes.length;
  
  int bytesSent = 0;
  request.sink.add(fileBytes);
  
  // Track progress
  onProgress(bytesSent / fileBytes.length);
  
  await request.sink.close();
  final response = await request.send();
  
  if (response.statusCode == 200) {
    onProgress(1.0); // Complete
  }
}
```

## Performance Tips

1. **Use Pagination**: For large directories, use `maxKeys` parameter
2. **Cache Metadata**: Cache file metadata to reduce API calls
3. **Compress Images**: Always compress images before upload
4. **Parallel Uploads**: Upload multiple files in parallel when possible
5. **CDN URLs**: Use the public URL (CDN) for serving files to users

## Logging

The repository layer includes automatic logging:

```dart
AppLogger.debug("Listed files successfully", params: {
  "teacherId": teacherId,
  "path": path,
  "itemCount": result.value.items.length,
});
```

To view logs, enable debug logging in your app configuration.

## Testing

### Mock Repository

```dart
class MockStorageRepository implements StorageRepository {
  @override
  Future<Result<ListFilesResponse>> listFiles(
    int teacherId, {
    String? path,
    String? continuationToken,
    int? maxKeys,
  }) async {
    // Return mock data
    return Ok(ListFilesResponse(
      items: [
        StorageItem(
          name: 'test.jpg',
          path: 'test.jpg',
          isFolder: false,
          size: 1024,
          lastModified: DateTime.now(),
          contentType: 'image/jpeg',
        ),
      ],
      folders: [],
      continuationToken: null,
      currentPrefix: '',
    ));
  }
  
  // Implement other methods...
}
```

## Troubleshooting

### Common Issues

1. **Upload fails with 403**: Check teacher authentication token
2. **File not found**: Verify the file path is correct
3. **Upload URL expired**: Generate new URL (default: 1 hour expiration)
4. **Large file timeout**: Increase timeout or compress file before upload

### Debug Mode

Enable detailed logging:

```dart
// In your app initialization
AppLogger.setLogLevel(LogLevel.debug);
```

## API Rate Limits

Currently no rate limits are enforced, but consider implementing:
- Per-teacher storage quota (e.g., 1GB)
- Upload size limits (e.g., 50MB per file)
- API request rate limits (e.g., 100 requests/minute)

## Contributing

When adding new features:
1. Update models in `storage_models.dart`
2. Add method to `R2StorageService` interface
3. Implement in `R2StorageServiceImpl`
4. Add repository method in `StorageRepository`
5. Implement in `StorageRepositoryImpl` with logging
6. Update this documentation
7. Add tests

## Support

For issues or questions:
- Check the [API documentation](../../../../../../../docs/api/storage.md)
- Review example code in this document
- Contact the development team

---

**Version**: 1.0.0  
**Last Updated**: November 17, 2025  
**Maintainer**: Poruaa Core Team

