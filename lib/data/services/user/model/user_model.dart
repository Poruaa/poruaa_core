sealed class UserModel {
  final num id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role; // "teacher" or "student"

  UserModel({required this.id, this.name, this.email, this.phone, this.role});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }

  static UserModel? fromJson(Map<String, dynamic> json) {
    if (json['role'] == 'teacher') {
      return TeacherUserModel.fromJson(json);
    } else if (json['role'] == 'student') {
      return StudentUserModel.fromJson(json);
    }
    throw Exception('Invalid user role');
  }

  @override
  String toString() {
    return toJson().toString();
  }

  String get label;
}

class TeacherUserModel extends UserModel {
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedIn;
  final String? instagram;
  final String? website;
  final bool premium;
  TeacherUserModel({
    required super.id,
    super.name,
    super.email,
    super.phone,
    this.whatsapp,
    this.telegram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.linkedIn,
    this.instagram,
    this.website,
    this.premium = false,
  }) : super(role: 'teacher');

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()..addAll({
      'whatsapp': whatsapp,
      'telegram': telegram,
      'youtube': youtube,
      'facebook': facebook,
      'twitter': twitter,
      'linkedIn': linkedIn,
      'instagram': instagram,
      'website': website,
      'premium': premium,
    });
  }

  static TeacherUserModel? fromJson(Map<String, dynamic> json) {
    try {
      return TeacherUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        whatsapp: json['whatsapp'],
        telegram: json['telegram'],
        youtube: json['youtube'],
        facebook: json['facebook'],
        twitter: json['twitter'],
        linkedIn: json['linkedin'],
        instagram: json['instagram'],
        website: json['website'],
        premium: json['premium'] ?? false,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  String get label => "Teacher";
}

class StudentUserModel extends UserModel {
  final String? fatherName;
  final String? fatherPhone;
  final String? collegeName;
  final String? hscSession;
  final String? division;

  StudentUserModel({
    required super.id,
    super.name,
    super.email,
    super.phone,
    this.fatherName,
    this.fatherPhone,
    this.collegeName,
    this.hscSession,
    this.division,
  }) : super(role: 'student');

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()..addAll({
      'father_name': fatherName,
      'father_phone': fatherPhone,
      'college_name': collegeName,
      'hsc_session': hscSession,
      'division': division,
    });
  }

  static StudentUserModel? fromJson(Map<String, dynamic> json) {
    try {
      return StudentUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        fatherName: json['father_name'],
        fatherPhone: json['father_phone'],
        collegeName: json['college_name'],
        hscSession: json['hsc_session'],
        division: json['division'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  String get label => "Student";
}
