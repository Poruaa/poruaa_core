import 'package:poruaa_core/data/services/rating/model/rating_model.dart';
import 'package:poruaa_core/data/services/rating/rating_service.dart';
import 'package:poruaa_core/domain/models/rating/course_rating.dart';
import 'package:poruaa_core/domain/models/rating/course_rating_with_student.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating_with_student.dart';
import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/utils/result.dart';

class RatingRepositoryImpl implements RatingRepository {
  final RatingService _ratingService;

  RatingRepositoryImpl(this._ratingService);

  @override
  Future<Result<CourseRating>> createCourseRating(
    int courseId,
    int rating,
    String? review,
  ) async {
    final input = CreateCourseRatingInput(
      courseId: courseId,
      rating: rating,
      review: review,
    );

    final result = await _ratingService.createCourseRating(input);

    return result.map((model) => _courseRatingModelToDomain(model));
  }

  @override
  Future<Result<CourseRating?>> getCourseRatingByStudent(int courseId) async {
    final result = await _ratingService.getCourseRatingByStudent(courseId);

    return result.map((model) => _courseRatingModelToDomain(model));
  }

  @override
  Future<Result<CourseRating>> updateCourseRating(
    int courseId,
    int rating,
    String? review,
  ) async {
    final input = UpdateRatingInput(rating: rating, review: review);

    final result = await _ratingService.updateCourseRating(courseId, input);

    return result.map((model) => _courseRatingModelToDomain(model));
  }

  @override
  Future<Result<bool>> deleteCourseRating(int courseId) async {
    return await _ratingService.deleteCourseRating(courseId);
  }

  @override
  Future<Result<List<CourseRatingWithStudent>>> getCourseRatingsWithStudents(
    int courseId,
  ) async {
    final result = await _ratingService.getCourseRatingsWithStudents(courseId);

    return result.map(
      (models) => models.map(_courseRatingWithStudentModelToDomain).toList(),
    );
  }

  @override
  Future<Result<ShortExamRating>> createShortExamRating(
    int shortExamId,
    int rating,
    String? review,
  ) async {
    final input = CreateShortExamRatingInput(
      shortExamId: shortExamId,
      rating: rating,
      review: review,
    );

    final result = await _ratingService.createShortExamRating(input);

    return result.map((model) => _shortExamRatingModelToDomain(model));
  }

  @override
  Future<Result<ShortExamRating?>> getShortExamRatingByStudent(
    int shortExamId,
  ) async {
    final result = await _ratingService.getShortExamRatingByStudent(
      shortExamId,
    );

    return result.map((model) => _shortExamRatingModelToDomain(model));
  }

  @override
  Future<Result<ShortExamRating>> updateShortExamRating(
    int shortExamId,
    int rating,
    String? review,
  ) async {
    final input = UpdateRatingInput(rating: rating, review: review);

    final result = await _ratingService.updateShortExamRating(
      shortExamId,
      input,
    );

    return result.map((model) => _shortExamRatingModelToDomain(model));
  }

  @override
  Future<Result<bool>> deleteShortExamRating(int shortExamId) async {
    return await _ratingService.deleteShortExamRating(shortExamId);
  }

  @override
  Future<Result<List<ShortExamRatingWithStudent>>>
  getShortExamRatingsWithStudents(int shortExamId) async {
    final result = await _ratingService.getShortExamRatingsWithStudents(
      shortExamId,
    );

    return result.map(
      (models) => models.map(_shortExamRatingWithStudentModelToDomain).toList(),
    );
  }

  // Helper methods to convert service models to domain models
  CourseRating _courseRatingModelToDomain(CourseRatingModel model) {
    return CourseRating(
      id: model.id ?? 0,
      courseId: model.courseId,
      studentId: model.studentId,
      rating: model.rating,
      review: model.review,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: model.updatedAt ?? DateTime.now(),
    );
  }

  CourseRatingWithStudent _courseRatingWithStudentModelToDomain(
    CourseRatingWithStudentModel model,
  ) {
    return CourseRatingWithStudent(
      id: model.id,
      courseId: model.courseId,
      studentId: model.studentId,
      rating: model.rating,
      review: model.review,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      studentName: model.studentName,
      studentPhone: model.studentPhone,
    );
  }

  ShortExamRating _shortExamRatingModelToDomain(ShortExamRatingModel model) {
    return ShortExamRating(
      id: model.id ?? 0,
      shortExamId: model.shortExamId,
      studentId: model.studentId,
      rating: model.rating,
      review: model.review,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: model.updatedAt ?? DateTime.now(),
    );
  }

  ShortExamRatingWithStudent _shortExamRatingWithStudentModelToDomain(
    ShortExamRatingWithStudentModel model,
  ) {
    return ShortExamRatingWithStudent(
      id: model.id,
      shortExamId: model.shortExamId,
      studentId: model.studentId,
      rating: model.rating,
      review: model.review,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      studentName: model.studentName,
      studentPhone: model.studentPhone,
    );
  }
}
