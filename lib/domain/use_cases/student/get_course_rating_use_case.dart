import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/course_rating.dart';
import 'package:poruaa_core/utils/result.dart';

class GetCourseRatingUseCase {
  final RatingRepository _ratingRepository;

  GetCourseRatingUseCase(this._ratingRepository);

  Future<Result<CourseRating?>> execute(int courseId) async {
    return await _ratingRepository.getCourseRatingByStudent(courseId);
  }
}
