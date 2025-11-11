class TeacherBookmark {
  final int id;
  final int? teacherId;
  final String? thumbnail;
  final String? description;
  final String? externalUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? teacherName;
  final String? teacherEmail;
  final String? teacherProfileUrl;

  TeacherBookmark({
    required this.id,
    this.teacherId,
    this.thumbnail,
    this.description,
    this.externalUrl,
    this.createdAt,
    this.updatedAt,
    this.teacherName,
    this.teacherEmail,
    this.teacherProfileUrl,
  });

  factory TeacherBookmark.fromJson(Map<String, dynamic> json) {
    return TeacherBookmark(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      externalUrl: json['external_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      teacherName: json['teacher_name'] as String?,
      teacherEmail: json['teacher_email'] as String?,
      teacherProfileUrl: json['teacher_profile_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher_id': teacherId,
      'thumbnail': thumbnail,
      'description': description,
      'external_url': externalUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'teacher_name': teacherName,
      'teacher_email': teacherEmail,
      'teacher_profile_url': teacherProfileUrl,
    };
  }
}
