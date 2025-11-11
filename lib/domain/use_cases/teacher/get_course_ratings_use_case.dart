import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/course_rating_with_student.dart';
import 'package:poruaa_core/utils/result.dart';

class GetCourseRatingsUseCase {
  final RatingRepository _ratingRepository;

  GetCourseRatingsUseCase(this._ratingRepository);

  Future<Result<List<CourseRatingWithStudent>>> execute(int courseId) async {
    return await _ratingRepository.getCourseRatingsWithStudents(courseId);
  }
}
