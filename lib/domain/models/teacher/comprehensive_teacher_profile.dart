import 'package:poruaa_core/domain/models/teacher_bookmark/teacher_bookmark.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/teacher_highlight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comprehensive_teacher_profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ComprehensiveTeacherProfile {
  final TeacherProfile teacher;
  final List<TeacherHighlight> highlights;
  final List<TeacherBookmark> bookmarks;
  final TeachingPhilosophy? teachingPhilosophy;
  final List<Specialization> specializations;
  final List<CourseTaught> courses;
  final List<Testimonial> testimonials;
  final TeacherStats? stats;
  final SocialLinks? socialLinks;
  final Availability? availability;

  ComprehensiveTeacherProfile({
    required this.teacher,
    required this.highlights,
    required this.bookmarks,
    required this.teachingPhilosophy,
    required this.specializations,
    required this.courses,
    required this.testimonials,
    required this.stats,
    required this.socialLinks,
    required this.availability,
  });

  factory ComprehensiveTeacherProfile.fromJson(Map<String, dynamic> json) {
    try {
      return _$ComprehensiveTeacherProfileFromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$ComprehensiveTeacherProfileToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TeacherProfile {
  final int id;
  final int userId;
  final String name;
  final String? email;
  final String? phone;
  final String? whatsapp;
  final String? telegram;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? linkedin;
  final String? youtube;
  final String? website;
  final String? profileImage;
  final String? bannerImage;
  final String? bio;
  final String? title;
  final String? institution;
  final String? location;
  final DateTime? joinedDate;
  final bool isVerified;
  final String? rating;
  final int totalStudents;
  final int totalCourses;
  final int yearsExperience;
  final double? consultationFee;
  final String? currency;
  final String? timezone;
  final bool isAvailable;
  final DateTime? nextAvailableSlot;

  TeacherProfile({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    this.phone,
    this.whatsapp,
    this.telegram,
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.youtube,
    this.website,
    this.profileImage,
    this.bannerImage,
    this.bio,
    this.title,
    this.institution,
    this.location,
    required this.joinedDate,
    required this.isVerified,
    required this.rating,
    required this.totalStudents,
    required this.totalCourses,
    required this.yearsExperience,
    this.consultationFee,
    this.currency,
    this.timezone,
    required this.isAvailable,
    this.nextAvailableSlot,
  });

  factory TeacherProfile.fromJson(Map<String, dynamic> json) {
    return _$TeacherProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeacherProfileToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TeachingPhilosophy {
  final String? quote;
  final String? description;
  final List<TeachingPrinciple> principles;

  TeachingPhilosophy({this.quote, this.description, required this.principles});

  factory TeachingPhilosophy.fromJson(Map<String, dynamic> json) =>
      _$TeachingPhilosophyFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingPhilosophyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TeachingPrinciple {
  final String emoji;
  final String title;
  final String description;

  TeachingPrinciple({
    required this.emoji,
    required this.title,
    required this.description,
  });

  factory TeachingPrinciple.fromJson(Map<String, dynamic> json) =>
      _$TeachingPrincipleFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingPrincipleToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Specialization {
  final int id;
  final String title;
  final String? icon;
  final List<String> skills;
  final DateTime? createdAt;

  Specialization({
    required this.id,
    required this.title,
    this.icon,
    required this.skills,
    this.createdAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CourseTaught {
  final int id;
  final String? title;
  final String? code;
  final String? description;
  final String? icon;
  final String? duration;
  final String? level;
  final int? enrolledStudents;
  final String? rating;
  final DateTime? createdAt;

  CourseTaught({
    required this.id,
    required this.title,
    required this.code,
    required this.description,
    required this.icon,
    required this.duration,
    required this.level,
    required this.enrolledStudents,
    required this.rating,
    required this.createdAt,
  });

  factory CourseTaught.fromJson(Map<String, dynamic> json) =>
      _$CourseTaughtFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTaughtToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Testimonial {
  final int id;
  final String? studentName;
  final String? studentRole;
  final String? testimonial;
  final int rating;
  final String? course;
  final DateTime createdAt;

  Testimonial({
    required this.id,
    required this.studentName,
    required this.studentRole,
    required this.testimonial,
    required this.rating,
    required this.course,
    required this.createdAt,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) =>
      _$TestimonialFromJson(json);

  Map<String, dynamic> toJson() => _$TestimonialToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TeacherStats {
  final int id;
  final int? totalStudents;
  final int? totalCourses;
  final String? successRate;
  final int? yearsExperience;
  final String? averageRating;
  final int? totalHoursTaught;
  final DateTime? createdAt;

  TeacherStats({
    required this.id,
    required this.totalStudents,
    required this.totalCourses,
    required this.successRate,
    required this.yearsExperience,
    required this.averageRating,
    required this.totalHoursTaught,
    required this.createdAt,
  });

  factory TeacherStats.fromJson(Map<String, dynamic> json) =>
      _$TeacherStatsFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherStatsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SocialLinks {
  final String? website;
  final String? linkedin;
  final String? twitter;
  final String? youtube;
  final String? github;

  SocialLinks({
    this.website,
    this.linkedin,
    this.twitter,
    this.youtube,
    this.github,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLinksToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Availability {
  final bool isAvailable;
  final DateTime? nextAvailableSlot;
  final String? timezone;
  final double? consultationFee;
  final String? currency;

  Availability({
    required this.isAvailable,
    this.nextAvailableSlot,
    this.timezone,
    this.consultationFee,
    this.currency,
  });

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}
