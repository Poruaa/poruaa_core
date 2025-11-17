# Storage Repository Documentation

## Overview

The `StorageRepository` provides a high-level, simplified interface for managing files in Cloudflare R2 storage. It wraps the `R2StorageService` and adds additional features like logging, error handling, and a cleaner API.

## Quick Start

### Initialization

```dart
import 'package:poruaa_core/data/repositories/storage/storage_repository_impl.dart';
import 'package:poruaa_core/data/services/storage/r2_storage_service_impl.dart';

// Create service
final r2Service = R2StorageServiceImpl(apiService: authorizedApiService);

// Create repository
final storageRepo = StorageRepositoryImpl(storageService: r2Service);
```

## API Methods

### 1. List Files

```dart
Future<Result<ListFilesResponse>> listFiles(
  int teacherId, {
  String? path,
  String? continuationToken,
  int? maxKeys,
});
```

**Parameters:**
- `teacherId` - The teacher's ID
- `path` - Optional folder path (default: root)
- `continuationToken` - For pagination
- `maxKeys` - Maximum items to return (default: 1000)

**Example:**

```dart
final result = await storageRepo.listFiles(123, path: 'images/');
```

---

### 2. Generate Upload URL

```dart
Future<Result<UploadUrlResponse>> generateUploadUrl(
  int teacherId, {
  required String filePath,
  String? contentType,
  int? expiresInSeconds,
});
```

**Parameters:**
- `teacherId` - The teacher's ID
- `filePath` - Destination path for the file
- `contentType` - MIME type (e.g., 'image/jpeg')
- `expiresInSeconds` - URL expiration (default: 3600)

**Example:**

```dart
final result = await storageRepo.generateUploadUrl(
  123,
  filePath: 'docs/report.pdf',
  contentType: 'application/pdf',
  expiresInSeconds: 1800,
);
```

---

### 3. Create Folder

```dart
Future<Result<CreateFolderResponse>> createFolder(
  int teacherId,
  String folderPath,
);
```

**Parameters:**
- `teacherId` - The teacher's ID
- `folderPath` - Path for the new folder

**Example:**

```dart
final result = await storageRepo.createFolder(123, 'documents/2025');
```

---

### 4. Delete File

```dart
Future<Result<DeleteResponse>> deleteFile(
  int teacherId,
  String path, {
  bool recursive = false,
});
```

**Parameters:**
- `teacherId` - The teacher's ID
- `path` - File or folder path to delete
- `recursive` - Delete folder contents (default: false)

**Example:**

```dart
// Delete single file
await storageRepo.deleteFile(123, 'old-file.jpg');

// Delete folder and contents
await storageRepo.deleteFile(123, 'temp/', recursive: true);
```

---

### 5. Get File Metadata

```dart
Future<Result<FileMetadata>> getFileMetadata(
  int teacherId,
  String filePath,
);
```

**Parameters:**
- `teacherId` - The teacher's ID
- `filePath` - Path to the file

**Example:**

```dart
final result = await storageRepo.getFileMetadata(123, 'image.jpg');

if (result case Ok(:final metadata)) {
  print('Size: ${metadata.size} bytes');
  print('Type: ${metadata.contentType}');
}
```

---

### 6. Generate Download URL

```dart
Future<Result<DownloadUrlResponse>> generateDownloadUrl(
  int teacherId, {
  required String filePath,
  int? expiresInSeconds,
});
```

**Parameters:**
- `teacherId` - The teacher's ID
- `filePath` - Path to the file
- `expiresInSeconds` - URL expiration (default: 3600)

**Example:**

```dart
final result = await storageRepo.generateDownloadUrl(
  123,
  filePath: 'report.pdf',
  expiresInSeconds: 900,
);
```

## Complete Workflows

### Upload Workflow

```dart
// 1. Get presigned upload URL
final urlResult = await storageRepo.generateUploadUrl(
  teacherId,
  filePath: 'images/photo.jpg',
  contentType: 'image/jpeg',
);

if (urlResult case Ok(:final uploadData)) {
  // 2. Upload file to R2
  final response = await http.put(
    Uri.parse(uploadData.uploadUrl),
    headers: {'Content-Type': 'image/jpeg'},
    body: fileBytes,
  );
  
  // 3. Use public URL
  if (response.statusCode == 200) {
    final publicUrl = uploadData.publicUrl;
    await saveToDatabase(publicUrl);
  }
}
```

### Browse Files Workflow

```dart
// 1. List files in folder
final listResult = await storageRepo.listFiles(
  teacherId,
  path: 'documents/',
  maxKeys: 50,
);

if (listResult case Ok(:final data)) {
  // 2. Display folders
  for (var folder in data.folders) {
    print('📁 $folder');
  }
  
  // 3. Display files
  for (var item in data.items.where((i) => !i.isFolder)) {
    print('📄 ${item.name} - ${item.size} bytes');
  }
  
  // 4. Handle pagination
  if (data.continuationToken != null) {
    final nextPage = await storageRepo.listFiles(
      teacherId,
      path: 'documents/',
      continuationToken: data.continuationToken,
    );
  }
}
```

### Download Workflow

```dart
// 1. Generate download URL
final urlResult = await storageRepo.generateDownloadUrl(
  teacherId,
  filePath: 'documents/report.pdf',
);

if (urlResult case Ok(:final downloadData)) {
  // 2. Download file
  final response = await http.get(Uri.parse(downloadData.downloadUrl));
  
  if (response.statusCode == 200) {
    // 3. Save or display file
    await saveFile(response.bodyBytes);
  }
}
```

## Logging

All repository methods include automatic logging:

**Success logs:**
```dart
AppLogger.debug("Listed files successfully", params: {
  "teacherId": 123,
  "path": "images/",
  "itemCount": 15,
});
```

**Error logs:**
```dart
AppLogger.error("Failed to list files", error: "Network timeout");
```

## Error Handling

The repository uses the `Result<T>` pattern for all operations:

```dart
switch (result) {
  case Ok(:final value):
    // Success - use value
  case Err(:final error):
    // Error - handle error
}
```

## Key Features

✅ **Simplified API** - Clean method signatures  
✅ **Automatic Logging** - Debug and error logs  
✅ **Type Safety** - Full Dart type safety  
✅ **Error Handling** - Result pattern for all operations  
✅ **Null Safety** - Complete null-safety support  

## Differences from Service Layer

| Feature | Repository | Service |
|---------|-----------|---------|
| API | Simplified | Direct API mapping |
| Logging | Automatic | Manual |
| Error Messages | User-friendly | Technical |
| Method Params | Named, optional | Explicit DTOs |

## Usage Recommendations

✅ **Use Repository** for:
- Application/UI layer
- Business logic
- User-facing features

❌ **Use Service directly** for:
- Low-level operations
- Testing purposes
- Custom implementations

## Examples by Use Case

### File Manager UI

```dart
class FileManagerController {
  final StorageRepository _repo;
  final int teacherId;
  
  FileManagerController(this._repo, this.teacherId);
  
  Future<List<StorageItem>> loadFiles(String path) async {
    final result = await _repo.listFiles(teacherId, path: path);
    return result.isOk ? result.value.items : [];
  }
  
  Future<bool> uploadFile(String path, Uint8List bytes) async {
    // Generate upload URL
    final urlResult = await _repo.generateUploadUrl(
      teacherId,
      filePath: path,
      contentType: 'application/octet-stream',
    );
    
    if (urlResult case Ok(:final data)) {
      // Upload to R2
      final response = await http.put(
        Uri.parse(data.uploadUrl),
        body: bytes,
      );
      return response.statusCode == 200;
    }
    
    return false;
  }
  
  Future<bool> deleteFile(String path) async {
    final result = await _repo.deleteFile(teacherId, path);
    return result.isOk;
  }
}
```

### Profile Image Uploader

```dart
class ProfileImageUploader {
  final StorageRepository _repo;
  
  ProfileImageUploader(this._repo);
  
  Future<String?> uploadProfileImage(
    int teacherId,
    File imageFile,
  ) async {
    // Compress image
    final compressed = await compressImage(imageFile);
    
    // Generate unique filename
    final filename = 'images/profile/${DateTime.now().millisecondsSinceEpoch}.jpg';
    
    // Get upload URL
    final urlResult = await _repo.generateUploadUrl(
      teacherId,
      filePath: filename,
      contentType: 'image/jpeg',
    );
    
    if (urlResult case Ok(:final data)) {
      // Upload
      final response = await http.put(
        Uri.parse(data.uploadUrl),
        headers: {'Content-Type': 'image/jpeg'},
        body: compressed,
      );
      
      if (response.statusCode == 200) {
        return data.publicUrl; // Return CDN URL
      }
    }
    
    return null;
  }
}
```

### Document Manager

```dart
class DocumentManager {
  final StorageRepository _repo;
  
  DocumentManager(this._repo);
  
  Future<void> organizeDocuments(int teacherId) async {
    // Create folder structure
    final folders = [
      'documents/invoices',
      'documents/reports',
      'documents/contracts',
    ];
    
    for (var folder in folders) {
      await _repo.createFolder(teacherId, folder);
    }
  }
  
  Future<void> cleanupOldDocuments(
    int teacherId,
    Duration maxAge,
  ) async {
    final result = await _repo.listFiles(teacherId, path: 'documents/');
    
    if (result case Ok(:final data)) {
      final cutoff = DateTime.now().subtract(maxAge);
      
      for (var item in data.items) {
        if (item.lastModified?.isBefore(cutoff) ?? false) {
          await _repo.deleteFile(teacherId, item.path);
        }
      }
    }
  }
  
  Future<String?> shareDocument(
    int teacherId,
    String path,
    Duration validity,
  ) async {
    final result = await _repo.generateDownloadUrl(
      teacherId,
      filePath: path,
      expiresInSeconds: validity.inSeconds,
    );
    
    return result.isOk ? result.value.downloadUrl : null;
  }
}
```

## Testing

### Mock Repository

```dart
class MockStorageRepository extends Mock implements StorageRepository {}

// In tests
final mockRepo = MockStorageRepository();

when(() => mockRepo.listFiles(any(), path: any(named: 'path')))
    .thenAnswer((_) async => Ok(mockListResponse));

when(() => mockRepo.uploadFile(any(), any()))
    .thenAnswer((_) async => Ok(mockUploadResponse));
```

## Performance Tips

1. **Cache file lists** - Don't query repeatedly
2. **Use pagination** - Set appropriate `maxKeys`
3. **Batch operations** - Upload/delete multiple files efficiently
4. **CDN URLs** - Use public URLs for serving content

## See Also

- [Service Layer Documentation](../../services/storage/README.md)
- [API Reference](../../../../../../../docs/api/storage.md)
- [Data Models](../../services/storage/model/storage_models.dart)

---

**Version**: 1.0.0  
**Last Updated**: November 17, 2025

