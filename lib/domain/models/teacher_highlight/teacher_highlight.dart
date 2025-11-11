class TeacherHighlight {
  final int id;
  final int? teacherId;
  final String title;
  final String? description;
  final String? externalUrl;
  final String? thumbnail;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? teacherName;
  final String? teacherEmail;
  final String? teacherProfileUrl;

  TeacherHighlight({
    required this.id,
    required this.teacherId,
    required this.title,
    this.description,
    this.externalUrl,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.teacherName,
    required this.teacherEmail,
    this.teacherProfileUrl,
  });

  factory TeacherHighlight.fromJson(Map<String, dynamic> json) {
    return TeacherHighlight(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String?,
      externalUrl: json['external_url'] as String?,
      thumbnail: json['thumbnail'] as String?,
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
      'title': title,
      'description': description,
      'external_url': externalUrl,
      'thumbnail': thumbnail,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'teacher_name': teacherName,
      'teacher_email': teacherEmail,
      'teacher_profile_url': teacherProfileUrl,
    };
  }
}
