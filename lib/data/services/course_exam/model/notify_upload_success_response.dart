class NotifyUploadSuccessResponse {
  final bool success;
  final String message;
  final int storageFileId;
  final int? sizeBytes;

  NotifyUploadSuccessResponse({
    required this.success,
    required this.message,
    required this.storageFileId,
    this.sizeBytes,
  });

  factory NotifyUploadSuccessResponse.fromJson(Map<String, dynamic> json) {
    return NotifyUploadSuccessResponse(
      success: json["success"] as bool,
      message: json["message"] as String,
      storageFileId: json["storage_file_id"] as int,
      sizeBytes: json["size_bytes"] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "storage_file_id": storageFileId,
      if (sizeBytes != null) "size_bytes": sizeBytes,
    };
  }
}
