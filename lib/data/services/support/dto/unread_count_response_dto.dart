class UnreadCountResponseDto {
  final int unreadCount;

  UnreadCountResponseDto({required this.unreadCount});

  factory UnreadCountResponseDto.fromJson(Map<String, dynamic> json) {
    return UnreadCountResponseDto(unreadCount: json['unread_count'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'unread_count': unreadCount};
  }
}
