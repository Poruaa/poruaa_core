import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/domain/models/teacher/comprehensive_teacher_profile.dart';
import 'package:poruaa_core/utils/result.dart';

class ComprehensiveTeacherService {
  final AuthorizedApiService _apiService;

  ComprehensiveTeacherService({required AuthorizedApiService apiService})
    : _apiService = apiService;

  Future<Result<ComprehensiveTeacherProfile>> getComprehensiveTeacherProfile(
    int teacherId,
  ) async {
    try {
      final response = await _apiService.get(
        'teachers/$teacherId/comprehensive',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          final Map<String, dynamic> jsonData = json.decode(
            response.value.body,
          );
          final profile = ComprehensiveTeacherProfile.fromJson(jsonData);
          return Ok(profile);
        case Err():
          return Err('Failed to load teacher profile: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> updateTeachingPhilosophy(
    int teacherId,
    TeachingPhilosophy philosophy,
  ) async {
    try {
      final response = await _apiService.put(
        'teachers/$teacherId/philosophy',
        body: json.encode(philosophy.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to update teaching philosophy: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> deleteTeachingPhilosophy(int teacherId) async {
    try {
      final response = await _apiService.delete(
        'teachers/$teacherId/philosophy',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to delete teaching philosophy: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> updateSpecializations(
    int teacherId,
    List<Specialization> specializations,
  ) async {
    try {
      final response = await _apiService.put(
        'teachers/$teacherId/specializations',
        body: json.encode(specializations.map((s) => s.toJson()).toList()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to update specializations: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> createSpecialization(
    int teacherId,
    Specialization specialization,
  ) async {
    try {
      final response = await _apiService.post(
        'teachers/$teacherId/specializations',
        body: json.encode(specialization.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to create specialization: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> updateSpecialization(
    int teacherId,
    Specialization specialization,
  ) async {
    try {
      final response = await _apiService.put(
        'teachers/$teacherId/specializations/${specialization.id}',
        body: json.encode(specialization.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to update specialization: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> deleteSpecialization(
    int teacherId,
    int specializationId,
  ) async {
    try {
      final response = await _apiService.delete(
        'teachers/$teacherId/specializations/$specializationId',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to delete specialization: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> createCourse(int teacherId, CourseTaught course) async {
    try {
      final response = await _apiService.post(
        'teachers/$teacherId/courses-taught',
        body: json.encode(course.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to create course: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> updateCourse(int teacherId, CourseTaught course) async {
    try {
      final response = await _apiService.put(
        'teachers/$teacherId/courses-taught/${course.id}',
        body: json.encode(course.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to update course: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> deleteCourse(int teacherId, int courseId) async {
    try {
      final response = await _apiService.delete(
        'teachers/$teacherId/courses-taught/$courseId',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to delete course: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> createTestimonial(
    int teacherId,
    Testimonial testimonial,
  ) async {
    try {
      // Convert Testimonial to the API format
      final requestBody = {
        'student_name': testimonial.studentName ?? '',
        'student_role': testimonial.studentRole,
        'testimonial': testimonial.testimonial ?? '',
        'rating': testimonial.rating,
        'course': testimonial.course,
      };

      final response = await _apiService.post(
        'teachers/$teacherId/testimonials',
        body: json.encode(requestBody),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to create testimonial: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> deleteTestimonial(
    int teacherId,
    int testimonialId,
  ) async {
    try {
      final response = await _apiService.delete(
        'teachers/$teacherId/testimonials/$testimonialId',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to delete testimonial: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  Future<Result<void>> updateTeacherStats(
    int teacherId,
    TeacherStats stats,
  ) async {
    try {
      final response = await _apiService.put(
        'teachers/$teacherId/stats',
        body: json.encode(stats.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      switch (response) {
        case Ok():
          return Ok(null);
        case Err():
          return Err('Failed to update teacher stats: ${response.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }
}
