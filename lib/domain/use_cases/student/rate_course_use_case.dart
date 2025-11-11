import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/course_rating.dart';
import 'package:poruaa_core/utils/result.dart';

class RateCourseUseCase {
  final RatingRepository _ratingRepository;

  RateCourseUseCase(this._ratingRepository);

  Future<Result<CourseRating>> execute({
    required int courseId,
    required int rating,
    String? review,
  }) async {
    // Validate rating range
    if (rating < 1 || rating > 5) {
      return Result.error('Rating must be between 1 and 5');
    }

    return await _ratingRepository.createCourseRating(courseId, rating, review);
  }
}
