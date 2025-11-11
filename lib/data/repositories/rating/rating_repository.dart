import 'package:poruaa_core/domain/models/rating/course_rating.dart';
import 'package:poruaa_core/domain/models/rating/course_rating_with_student.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating_with_student.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class RatingRepository {
  // Course Rating Operations
  Future<Result<CourseRating>> createCourseRating(
    int courseId,
    int rating,
    String? review,
  );

  Future<Result<CourseRating?>> getCourseRatingByStudent(int courseId);

  Future<Result<CourseRating>> updateCourseRating(
    int courseId,
    int rating,
    String? review,
  );

  Future<Result<bool>> deleteCourseRating(int courseId);

  Future<Result<List<CourseRatingWithStudent>>> getCourseRatingsWithStudents(
    int courseId,
  );

  // Short Exam Rating Operations
  Future<Result<ShortExamRating>> createShortExamRating(
    int shortExamId,
    int rating,
    String? review,
  );

  Future<Result<ShortExamRating?>> getShortExamRatingByStudent(int shortExamId);

  Future<Result<ShortExamRating>> updateShortExamRating(
    int shortExamId,
    int rating,
    String? review,
  );

  Future<Result<bool>> deleteShortExamRating(int shortExamId);

  Future<Result<List<ShortExamRatingWithStudent>>>
  getShortExamRatingsWithStudents(int shortExamId);
}
