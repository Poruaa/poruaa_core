// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comprehensive_teacher_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComprehensiveTeacherProfile _$ComprehensiveTeacherProfileFromJson(
  Map<String, dynamic> json,
) => ComprehensiveTeacherProfile(
  teacher: TeacherProfile.fromJson(json['teacher'] as Map<String, dynamic>),
  highlights: (json['highlights'] as List<dynamic>)
      .map((e) => TeacherHighlight.fromJson(e as Map<String, dynamic>))
      .toList(),
  bookmarks: (json['bookmarks'] as List<dynamic>)
      .map((e) => TeacherBookmark.fromJson(e as Map<String, dynamic>))
      .toList(),
  teachingPhilosophy: json['teaching_philosophy'] == null
      ? null
      : TeachingPhilosophy.fromJson(
          json['teaching_philosophy'] as Map<String, dynamic>,
        ),
  specializations: (json['specializations'] as List<dynamic>)
      .map((e) => Specialization.fromJson(e as Map<String, dynamic>))
      .toList(),
  courses: (json['courses'] as List<dynamic>)
      .map((e) => CourseTaught.fromJson(e as Map<String, dynamic>))
      .toList(),
  testimonials: (json['testimonials'] as List<dynamic>)
      .map((e) => Testimonial.fromJson(e as Map<String, dynamic>))
      .toList(),
  stats: json['stats'] == null
      ? null
      : TeacherStats.fromJson(json['stats'] as Map<String, dynamic>),
  socialLinks: json['social_links'] == null
      ? null
      : SocialLinks.fromJson(json['social_links'] as Map<String, dynamic>),
  availability: json['availability'] == null
      ? null
      : Availability.fromJson(json['availability'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ComprehensiveTeacherProfileToJson(
  ComprehensiveTeacherProfile instance,
) => <String, dynamic>{
  'teacher': instance.teacher,
  'highlights': instance.highlights,
  'bookmarks': instance.bookmarks,
  'teaching_philosophy': instance.teachingPhilosophy,
  'specializations': instance.specializations,
  'courses': instance.courses,
  'testimonials': instance.testimonials,
  'stats': instance.stats,
  'social_links': instance.socialLinks,
  'availability': instance.availability,
};

TeacherProfile _$TeacherProfileFromJson(Map<String, dynamic> json) =>
    TeacherProfile(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      telegram: json['telegram'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      linkedin: json['linkedin'] as String?,
      youtube: json['youtube'] as String?,
      website: json['website'] as String?,
      profileImage: json['profile_image'] as String?,
      bannerImage: json['banner_image'] as String?,
      bio: json['bio'] as String?,
      title: json['title'] as String?,
      institution: json['institution'] as String?,
      location: json['location'] as String?,
      joinedDate: json['joined_date'] == null
          ? null
          : DateTime.parse(json['joined_date'] as String),
      isVerified: json['is_verified'] as bool,
      rating: json['rating'] as String?,
      totalStudents: (json['total_students'] as num).toInt(),
      totalCourses: (json['total_courses'] as num).toInt(),
      yearsExperience: (json['years_experience'] as num).toInt(),
      consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      timezone: json['timezone'] as String?,
      isAvailable: json['is_available'] as bool,
      nextAvailableSlot: json['next_available_slot'] == null
          ? null
          : DateTime.parse(json['next_available_slot'] as String),
    );

Map<String, dynamic> _$TeacherProfileToJson(TeacherProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'telegram': instance.telegram,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'youtube': instance.youtube,
      'website': instance.website,
      'profile_image': instance.profileImage,
      'banner_image': instance.bannerImage,
      'bio': instance.bio,
      'title': instance.title,
      'institution': instance.institution,
      'location': instance.location,
      'joined_date': instance.joinedDate?.toIso8601String(),
      'is_verified': instance.isVerified,
      'rating': instance.rating,
      'total_students': instance.totalStudents,
      'total_courses': instance.totalCourses,
      'years_experience': instance.yearsExperience,
      'consultation_fee': instance.consultationFee,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'is_available': instance.isAvailable,
      'next_available_slot': instance.nextAvailableSlot?.toIso8601String(),
    };

TeachingPhilosophy _$TeachingPhilosophyFromJson(Map<String, dynamic> json) =>
    TeachingPhilosophy(
      quote: json['quote'] as String,
      description: json['description'] as String,
      principles: (json['principles'] as List<dynamic>)
          .map((e) => TeachingPrinciple.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeachingPhilosophyToJson(TeachingPhilosophy instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'description': instance.description,
      'principles': instance.principles,
    };

TeachingPrinciple _$TeachingPrincipleFromJson(Map<String, dynamic> json) =>
    TeachingPrinciple(
      emoji: json['emoji'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TeachingPrincipleToJson(TeachingPrinciple instance) =>
    <String, dynamic>{
      'emoji': instance.emoji,
      'title': instance.title,
      'description': instance.description,
    };

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'skills': instance.skills,
      'created_at': instance.createdAt?.toIso8601String(),
    };

CourseTaught _$CourseTaughtFromJson(Map<String, dynamic> json) => CourseTaught(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  code: json['code'] as String?,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
  duration: json['duration'] as String?,
  level: json['level'] as String?,
  enrolledStudents: (json['enrolled_students'] as num?)?.toInt(),
  rating: json['rating'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CourseTaughtToJson(CourseTaught instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
      'description': instance.description,
      'icon': instance.icon,
      'duration': instance.duration,
      'level': instance.level,
      'enrolled_students': instance.enrolledStudents,
      'rating': instance.rating,
      'created_at': instance.createdAt?.toIso8601String(),
    };

Testimonial _$TestimonialFromJson(Map<String, dynamic> json) => Testimonial(
  id: (json['id'] as num).toInt(),
  studentName: json['student_name'] as String?,
  studentRole: json['student_role'] as String?,
  testimonial: json['testimonial'] as String?,
  rating: (json['rating'] as num).toInt(),
  course: json['course'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TestimonialToJson(Testimonial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_name': instance.studentName,
      'student_role': instance.studentRole,
      'testimonial': instance.testimonial,
      'rating': instance.rating,
      'course': instance.course,
      'created_at': instance.createdAt.toIso8601String(),
    };

TeacherStats _$TeacherStatsFromJson(Map<String, dynamic> json) => TeacherStats(
  id: (json['id'] as num).toInt(),
  totalStudents: (json['total_students'] as num?)?.toInt(),
  totalCourses: (json['total_courses'] as num?)?.toInt(),
  successRate: json['success_rate'] as String?,
  yearsExperience: (json['years_experience'] as num?)?.toInt(),
  averageRating: json['average_rating'] as String?,
  totalHoursTaught: (json['total_hours_taught'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TeacherStatsToJson(TeacherStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_students': instance.totalStudents,
      'total_courses': instance.totalCourses,
      'success_rate': instance.successRate,
      'years_experience': instance.yearsExperience,
      'average_rating': instance.averageRating,
      'total_hours_taught': instance.totalHoursTaught,
      'created_at': instance.createdAt?.toIso8601String(),
    };

SocialLinks _$SocialLinksFromJson(Map<String, dynamic> json) => SocialLinks(
  website: json['website'] as String?,
  linkedin: json['linkedin'] as String?,
  twitter: json['twitter'] as String?,
  youtube: json['youtube'] as String?,
  github: json['github'] as String?,
);

Map<String, dynamic> _$SocialLinksToJson(SocialLinks instance) =>
    <String, dynamic>{
      'website': instance.website,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'youtube': instance.youtube,
      'github': instance.github,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
  isAvailable: json['is_available'] as bool,
  nextAvailableSlot: json['next_available_slot'] == null
      ? null
      : DateTime.parse(json['next_available_slot'] as String),
  timezone: json['timezone'] as String?,
  consultationFee: (json['consultation_fee'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'is_available': instance.isAvailable,
      'next_available_slot': instance.nextAvailableSlot?.toIso8601String(),
      'timezone': instance.timezone,
      'consultation_fee': instance.consultationFee,
      'currency': instance.currency,
    };
