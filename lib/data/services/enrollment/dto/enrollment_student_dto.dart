class EnrollmentStudentDto {
  int id;
  int studentId;
  int courseId;
  DateTime createdAt;
  String name;
  String? phone;
  String? fatherName;
  String? fatherPhone;
  String? collegeName;
  String? hscSession;
  String? division;

  EnrollmentStudentDto({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.createdAt,
    required this.name,
    this.phone,
    this.fatherName,
    this.fatherPhone,
    this.collegeName,
    this.hscSession,
    this.division,
  });

  factory EnrollmentStudentDto.fromJson(Map<String, dynamic> json) {
    return EnrollmentStudentDto(
      id: json['id'] as int,
      studentId: json['student_id'] as int,
      courseId: json['course_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      phone: json['phone'] as String?,
      fatherName: json['father_name'] as String?,
      fatherPhone: json['father_phone'] as String?,
      collegeName: json['college_name'] as String?,
      hscSession: json['hsc_session'] as String?,
      division: json['division'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'course_id': courseId,
      'created_at': createdAt.toIso8601String(),
      'name': name,
      'phone': phone,
      'father_name': fatherName,
      'father_phone': fatherPhone,
      'college_name': collegeName,
      'hsc_session': hscSession,
      'division': division,
    };
  }
}
