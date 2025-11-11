import 'package:poruaa_core/domain/models/teacher/comprehensive_teacher_profile.dart';
import 'package:poruaa_core/data/services/teacher/comprehensive_teacher_service.dart';
import 'package:poruaa_core/utils/result.dart';

class ComprehensiveTeacherRepository {
  final ComprehensiveTeacherService _service;

  ComprehensiveTeacherRepository({required ComprehensiveTeacherService service})
    : _service = service;

  Future<Result<ComprehensiveTeacherProfile>> getComprehensiveTeacherProfile(
    int teacherId,
  ) async {
    return await _service.getComprehensiveTeacherProfile(teacherId);
  }

  Future<Result<void>> updateTeachingPhilosophy(
    int teacherId,
    TeachingPhilosophy philosophy,
  ) async {
    return await _service.updateTeachingPhilosophy(teacherId, philosophy);
  }

  Future<Result<void>> deleteTeachingPhilosophy(int teacherId) async {
    return await _service.deleteTeachingPhilosophy(teacherId);
  }

  Future<Result<void>> updateSpecializations(
    int teacherId,
    List<Specialization> specializations,
  ) async {
    return await _service.updateSpecializations(teacherId, specializations);
  }

  Future<Result<void>> createSpecialization(
    int teacherId,
    Specialization specialization,
  ) async {
    return await _service.createSpecialization(teacherId, specialization);
  }

  Future<Result<void>> updateSpecialization(
    int teacherId,
    Specialization specialization,
  ) async {
    return await _service.updateSpecialization(teacherId, specialization);
  }

  Future<Result<void>> deleteSpecialization(
    int teacherId,
    int specializationId,
  ) async {
    return await _service.deleteSpecialization(teacherId, specializationId);
  }

  Future<Result<void>> createCourse(int teacherId, CourseTaught course) async {
    return await _service.createCourse(teacherId, course);
  }

  Future<Result<void>> updateCourse(int teacherId, CourseTaught course) async {
    return await _service.updateCourse(teacherId, course);
  }

  Future<Result<void>> deleteCourse(int teacherId, int courseId) async {
    return await _service.deleteCourse(teacherId, courseId);
  }

  Future<Result<void>> createTestimonial(
    int teacherId,
    Testimonial testimonial,
  ) async {
    return await _service.createTestimonial(teacherId, testimonial);
  }

  Future<Result<void>> deleteTestimonial(
    int teacherId,
    int testimonialId,
  ) async {
    return await _service.deleteTestimonial(teacherId, testimonialId);
  }

  Future<Result<void>> updateTeacherStats(
    int teacherId,
    TeacherStats stats,
  ) async {
    return await _service.updateTeacherStats(teacherId, stats);
  }
}
