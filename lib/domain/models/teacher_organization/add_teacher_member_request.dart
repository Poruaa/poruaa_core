class AddTeacherMemberRequest {
  final int memberTeacherId;
  final String role;
  final List<String> permissions;

  AddTeacherMemberRequest({
    required this.memberTeacherId,
    required this.role,
    required this.permissions,
  });

  factory AddTeacherMemberRequest.fromJson(Map<String, dynamic> json) {
    return AddTeacherMemberRequest(
      memberTeacherId: json['member_teacher_id'] as int,
      role: json['role'] as String,
      permissions: List<String>.from(json['permissions'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'member_teacher_id': memberTeacherId,
      'role': role,
      'permissions': permissions,
    };
  }

  AddTeacherMemberRequest copyWith({
    int? memberTeacherId,
    String? role,
    List<String>? permissions,
  }) {
    return AddTeacherMemberRequest(
      memberTeacherId: memberTeacherId ?? this.memberTeacherId,
      role: role ?? this.role,
      permissions: permissions ?? this.permissions,
    );
  }
}
