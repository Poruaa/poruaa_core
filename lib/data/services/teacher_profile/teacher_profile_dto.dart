import 'package:poruaa_core/domain/models/series/series.dart';
import 'package:poruaa_core/domain/models/teacher/comprehensive_teacher_profile.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/teacher_bookmark.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/teacher_highlight.dart';

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
          ? double.tryParse(json['rating'].toString())
          : null,
      totalStudents: json['total_students'] as int?,
      totalCourses: json['total_courses'] as int?,
      yearsExperience: json['years_experience'] as int?,
      profileImage: json['profile_image'] as String?,
      bannerImage: json['banner_image'] as String?,
      consultationFee: json['consultation_fee'] != null
          ? double.tryParse(json['consultation_fee'].toString())
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

class EnhancedTeacherProfileWithSeriesDTO {
  final TeacherDetailsDTO teacher;
  final List<SeriesWithCoursesDTO> series;
  final List<TeacherHighlight> highlights;
  final List<TeacherBookmark> bookmarks;
  final TeachingPhilosophy? teachingPhilosophy;
  final List<Specialization> specializations;
  final List<CourseTaught> coursesTaught;
  final List<Testimonial> testimonials;
  final TeacherStats? stats;
  final SocialLinks socialLinks;
  final Availability availability;

  EnhancedTeacherProfileWithSeriesDTO({
    required this.teacher,
    required this.series,
    required this.highlights,
    required this.bookmarks,
    this.teachingPhilosophy,
    required this.specializations,
    required this.coursesTaught,
    required this.testimonials,
    this.stats,
    required this.socialLinks,
    required this.availability,
  });

  factory EnhancedTeacherProfileWithSeriesDTO.fromJson(
    Map<String, dynamic> json,
  ) {
    return EnhancedTeacherProfileWithSeriesDTO(
      teacher: TeacherDetailsDTO.fromJson(
        json['teacher'] as Map<String, dynamic>,
      ),
      series: (json['series'] as List<dynamic>)
          .map((s) => SeriesWithCoursesDTO.fromJson(s as Map<String, dynamic>))
          .toList(),
      highlights: (json['highlights'] as List<dynamic>)
          .map((h) => TeacherHighlight.fromJson(h as Map<String, dynamic>))
          .toList(),
      bookmarks: (json['bookmarks'] as List<dynamic>)
          .map((b) => TeacherBookmark.fromJson(b as Map<String, dynamic>))
          .toList(),
      teachingPhilosophy: json['teaching_philosophy'] != null
          ? TeachingPhilosophy.fromJson(
              json['teaching_philosophy'] as Map<String, dynamic>,
            )
          : null,
      specializations: (json['specializations'] as List<dynamic>)
          .map((s) => Specialization.fromJson(s as Map<String, dynamic>))
          .toList(),
      coursesTaught: (json['courses_taught'] as List<dynamic>)
          .map((c) => CourseTaught.fromJson(c as Map<String, dynamic>))
          .toList(),
      testimonials: (json['testimonials'] as List<dynamic>)
          .map((t) => Testimonial.fromJson(t as Map<String, dynamic>))
          .toList(),
      stats: json['stats'] != null
          ? TeacherStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
      socialLinks: SocialLinks.fromJson(
        json['social_links'] as Map<String, dynamic>,
      ),
      availability: Availability.fromJson(
        json['availability'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teacher': teacher.toJson(),
      'series': series.map((s) => s.toJson()).toList(),
      'highlights': highlights.map((h) => h.toJson()).toList(),
      'bookmarks': bookmarks.map((b) => b.toJson()).toList(),
      'teaching_philosophy': teachingPhilosophy?.toJson(),
      'specializations': specializations.map((s) => s.toJson()).toList(),
      'courses_taught': coursesTaught.map((c) => c.toJson()).toList(),
      'testimonials': testimonials.map((t) => t.toJson()).toList(),
      'stats': stats?.toJson(),
      'social_links': socialLinks.toJson(),
      'availability': availability.toJson(),
    };
  }
}
