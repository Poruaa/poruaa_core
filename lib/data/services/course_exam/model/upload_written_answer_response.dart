class UploadWrittenAnswerResponse {
  final String uploadUrl; // Presigned URL for direct upload
  final String publicUrl; // Public CDN URL after upload
  final String filePath; // Relative file path
  final int storageFileId; // Storage file record ID
  final int expiresInSeconds; // URL expiration time

  UploadWrittenAnswerResponse({
    required this.uploadUrl,
    required this.publicUrl,
    required this.filePath,
    required this.storageFileId,
    required this.expiresInSeconds,
  });

  factory UploadWrittenAnswerResponse.fromJson(Map<String, dynamic> json) {
    return UploadWrittenAnswerResponse(
      uploadUrl: json["upload_url"] as String,
      publicUrl: json["public_url"] as String,
      filePath: json["file_path"] as String,
      storageFileId: json["storage_file_id"] as int,
      expiresInSeconds: json["expires_in_seconds"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "upload_url": uploadUrl,
      "public_url": publicUrl,
      "file_path": filePath,
      "storage_file_id": storageFileId,
      "expires_in_seconds": expiresInSeconds,
    };
  }
}
