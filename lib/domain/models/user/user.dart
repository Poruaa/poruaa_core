import 'package:poruaa_core/data/services/user/model/user_model.dart';

sealed class User {
  final num id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role; // "teacher" or "student"

  User({required this.id, this.name, this.email, this.phone, this.role});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }

  factory User.fromUserModel(UserModel userModel) {
    return switch (userModel) {
      TeacherUserModel() => Teacher.fromUserModel(userModel),
      StudentUserModel() => Student.fromUserModel(userModel),
    };
  }

  static User? fromJson(Map<String, dynamic> json) {
    if (json['role'] == 'teacher') {
      return Teacher.fromJson(json);
    } else if (json['role'] == 'student') {
      return Student.fromJson(json);
    }
    throw Exception('Invalid user role');
  }

  @override
  String toString() {
    return "$label: ${toJson().toString()}";
  }

  String get label;
}

class Teacher extends User {
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedIn;
  final String? instagram;
  final String? website;
  final bool premium;
  final String? profileImage;

  Teacher({
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
    this.profileImage,
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
      'profile_image': profileImage,
    });
  }

  factory Teacher.fromUserModel(TeacherUserModel userModel) {
    return Teacher(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
      whatsapp: userModel.whatsapp,
      telegram: userModel.telegram,
      youtube: userModel.youtube,
      facebook: userModel.facebook,
      twitter: userModel.twitter,
      linkedIn: userModel.linkedIn,
      instagram: userModel.instagram,
      website: userModel.website,
      premium: userModel.premium,
      profileImage: userModel.profileImage,
    );
  }

  TeacherUserModel toUserModel() => TeacherUserModel(
    id: id,
    name: name,
    email: email,
    phone: phone,
    whatsapp: whatsapp,
    telegram: telegram,
    youtube: youtube,
    facebook: facebook,
    twitter: twitter,
    linkedIn: linkedIn,
    instagram: instagram,
    website: website,
    premium: premium,
    profileImage: profileImage,
  );

  static Teacher? fromJson(Map<String, dynamic> json) {
    try {
      return Teacher(
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
        premium: json['premium'],
        profileImage: json['profile_image'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  String get label => "Teacher";
}

class Student extends User {
  final String? fatherName;
  final String? fatherPhone;
  final String? collegeName;
  final String? hscSession;
  final String? division;

  Student({
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

  static Student? fromJson(Map<String, dynamic> json) {
    try {
      return Student(
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

  factory Student.fromUserModel(StudentUserModel userModel) {
    return Student(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
      fatherName: userModel.fatherName,
      fatherPhone: userModel.fatherPhone,
      collegeName: userModel.collegeName,
      hscSession: userModel.hscSession,
      division: userModel.division,
    );
  }

  StudentUserModel toUserModel() => StudentUserModel(
    id: id,
    name: name,
    email: email,
    phone: phone,
    fatherName: fatherName,
    fatherPhone: fatherPhone,
    collegeName: collegeName,
    hscSession: hscSession,
    division: division,
  );

  Student copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? fatherName,
    String? fatherPhone,
    String? collegeName,
    String? hscSession,
    String? division,
  }) => Student(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    fatherName: fatherName ?? this.fatherName,
    fatherPhone: fatherPhone ?? this.fatherPhone,
    collegeName: collegeName ?? this.collegeName,
    hscSession: hscSession ?? this.hscSession,
    division: division ?? this.division,
  );

  @override
  String get label => "Student";
}

class Organization extends User {
  Organization({
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
    this.profileImage,
  }) : super(role: 'organization');

  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedIn;
  final String? instagram;
  final String? website;
  final bool premium;
  final String? profileImage;
  factory Organization.fromTeacher(Teacher teacher) {
    return Organization(
      id: teacher.id,
      name: teacher.name,
      email: teacher.email,
      phone: teacher.phone,
      whatsapp: teacher.whatsapp,
      telegram: teacher.telegram,
      youtube: teacher.youtube,
      facebook: teacher.facebook,
      twitter: teacher.twitter,
      linkedIn: teacher.linkedIn,
      instagram: teacher.instagram,
      website: teacher.website,
      premium: teacher.premium,
      profileImage: teacher.profileImage,
    );
  }

  @override
  String get label => "Organization";
}
