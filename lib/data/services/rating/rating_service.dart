import 'package:poruaa_core/data/services/rating/model/rating_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class RatingService {
  // Course Rating Operations
  Future<Result<CourseRatingModel>> createCourseRating(
    CreateCourseRatingInput input,
  );

  Future<Result<CourseRatingModel>> getCourseRatingByStudent(int courseId);

  Future<Result<CourseRatingModel>> updateCourseRating(
    int courseId,
    UpdateRatingInput input,
  );

  Future<Result<bool>> deleteCourseRating(int courseId);

  Future<Result<List<CourseRatingWithStudentModel>>>
  getCourseRatingsWithStudents(int courseId);

  // Short Exam Rating Operations
  Future<Result<ShortExamRatingModel>> createShortExamRating(
    CreateShortExamRatingInput input,
  );

  Future<Result<ShortExamRatingModel>> getShortExamRatingByStudent(
    int shortExamId,
  );

  Future<Result<ShortExamRatingModel>> updateShortExamRating(
    int shortExamId,
    UpdateRatingInput input,
  );

  Future<Result<bool>> deleteShortExamRating(int shortExamId);

  Future<Result<List<ShortExamRatingWithStudentModel>>>
  getShortExamRatingsWithStudents(int shortExamId);
}
