import 'package:poruaa_core/domain/models/series/series.dart';

class TeacherDetailsDTO {
  final int id;
  final String name;
  final String profileUrl;
  final String? phone;
  final String email;
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? instagram;
  final String? website;
  final String? bio;
  final String? title;
  final String? institution;
  final String? location;
  final DateTime? joinedDate;
  final bool? isVerified;
  final double? rating;
  final int? totalStudents;
  final int? totalCourses;
  final int? yearsExperience;
  final String? profileImage;
  final String? bannerImage;
  final double? consultationFee;
  final String? currency;
  final String? timezone;
  final bool? isAvailable;
  final DateTime? nextAvailableSlot;

  TeacherDetailsDTO({
    required this.id,
    required this.name,
    required this.profileUrl,
    this.phone,
    required this.email,
    this.whatsapp,
    this.telegram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.instagram,
    this.website,
    this.bio,
    this.title,
    this.institution,
    this.location,
    this.joinedDate,
    this.isVerified,
    this.rating,
    this.totalStudents,
    this.totalCourses,
    this.yearsExperience,
    this.profileImage,
    this.bannerImage,
    this.consultationFee,
    this.currency,
    this.timezone,
    this.isAvailable,
    this.nextAvailableSlot,
  });

  factory TeacherDetailsDTO.fromJson(Map<String, dynamic> json) {
    return TeacherDetailsDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      profileUrl: json['profile_url'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String,
      whatsapp: json['whatsapp'] as String?,
      telegram: json['telegram'] as String?,
      youtube: json['youtube'] as String?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      linkedin: json['linkedin'] as String?,
      instagram: json['instagram'] as String?,
      website: json['website'] as String?,
      bio: json['bio'] as String?,
      title: json['title'] as String?,
      institution: json['institution'] as String?,
      location: json['location'] as String?,
      joinedDate: json['joined_date'] != null
          ? DateTime.parse(json['joined_date'] as String)
          : null,
      isVerified: json['is_verified'] as bool?,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'] as String)?.toDouble()
          : null,
      totalStudents: json['total_students'] as int?,
      totalCourses: json['total_courses'] as int?,
      yearsExperience: json['years_experience'] as int?,
      profileImage: json['profile_image'] as String?,
      bannerImage: json['banner_image'] as String?,
      consultationFee: json['consultation_fee'] != null
          ? (json['consultation_fee'] as num).toDouble()
          : null,
      currency: json['currency'] as String?,
      timezone: json['timezone'] as String?,
      isAvailable: json['is_available'] as bool?,
      nextAvailableSlot: json['next_available_slot'] != null
          ? DateTime.parse(json['next_available_slot'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_url': profileUrl,
      'phone': phone,
      'email': email,
      'whatsapp': whatsapp,
      'telegram': telegram,
      'youtube': youtube,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'instagram': instagram,
      'website': website,
      'bio': bio,
      'title': title,
      'institution': institution,
      'location': location,
      'joined_date': joinedDate?.toIso8601String(),
      'is_verified': isVerified,
      'rating': rating,
      'total_students': totalStudents,
      'total_courses': totalCourses,
      'years_experience': yearsExperience,
      'profile_image': profileImage,
      'banner_image': bannerImage,
      'consultation_fee': consultationFee,
      'currency': currency,
      'timezone': timezone,
      'is_available': isAvailable,
      'next_available_slot': nextAvailableSlot?.toIso8601String(),
    };
  }
}

class TeacherProfileWithSeriesDTO {
  final TeacherDetailsDTO teacher;
  final List<SeriesWithCoursesDTO> series;

  TeacherProfileWithSeriesDTO({required this.teacher, required this.series});

  factory TeacherProfileWithSeriesDTO.fromJson(Map<String, dynamic> json) {
    return TeacherProfileWithSeriesDTO(
      teacher: TeacherDetailsDTO.fromJson(
        json['teacher'] as Map<String, dynamic>,
      ),
      series: (json['series'] as List<dynamic>)
          .map((s) => SeriesWithCoursesDTO.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teacher': teacher.toJson(),
      'series': series.map((s) => s.toJson()).toList(),
    };
  }
}
