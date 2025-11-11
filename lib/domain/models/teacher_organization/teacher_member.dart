class TeacherMember {
  final int id;
  final int ownerTeacherId;
  final int memberTeacherId;
  final String role;
  final List<String> permissions;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? memberName;
  final String? memberEmail;
  final String? memberProfileUrl;
  final String? ownerName;
  final String? ownerEmail;

  TeacherMember({
    required this.id,
    required this.ownerTeacherId,
    required this.memberTeacherId,
    required this.role,
    required this.permissions,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.memberName,
    this.memberEmail,
    this.memberProfileUrl,
    this.ownerName,
    this.ownerEmail,
  });

  factory TeacherMember.fromJson(Map<String, dynamic> json) {
    return TeacherMember(
      id: json['id'] as int,
      ownerTeacherId: json['owner_teacher_id'] as int,
      memberTeacherId: json['member_teacher_id'] as int,
      role: json['role'] as String,
      permissions: List<String>.from(json['permissions'] as List),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      memberName: json['member_name'] as String?,
      memberEmail: json['member_email'] as String?,
      memberProfileUrl: json['member_profile_url'] as String?,
      ownerName: json['owner_name'] as String?,
      ownerEmail: json['owner_email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_teacher_id': ownerTeacherId,
      'member_teacher_id': memberTeacherId,
      'role': role,
      'permissions': permissions,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'member_name': memberName,
      'member_email': memberEmail,
      'member_profile_url': memberProfileUrl,
      'owner_name': ownerName,
      'owner_email': ownerEmail,
    };
  }

  TeacherMember copyWith({
    int? id,
    int? ownerTeacherId,
    int? memberTeacherId,
    String? role,
    List<String>? permissions,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? memberName,
    String? memberEmail,
    String? memberProfileUrl,
    String? ownerName,
    String? ownerEmail,
  }) {
    return TeacherMember(
      id: id ?? this.id,
      ownerTeacherId: ownerTeacherId ?? this.ownerTeacherId,
      memberTeacherId: memberTeacherId ?? this.memberTeacherId,
      role: role ?? this.role,
      permissions: permissions ?? this.permissions,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      memberName: memberName ?? this.memberName,
      memberEmail: memberEmail ?? this.memberEmail,
      memberProfileUrl: memberProfileUrl ?? this.memberProfileUrl,
      ownerName: ownerName ?? this.ownerName,
      ownerEmail: ownerEmail ?? this.ownerEmail,
    );
  }
}
