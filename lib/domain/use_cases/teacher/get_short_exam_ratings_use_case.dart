import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating_with_student.dart';
import 'package:poruaa_core/utils/result.dart';

class GetShortExamRatingsUseCase {
  final RatingRepository _ratingRepository;

  GetShortExamRatingsUseCase(this._ratingRepository);

  Future<Result<List<ShortExamRatingWithStudent>>> execute(
    int shortExamId,
  ) async {
    return await _ratingRepository.getShortExamRatingsWithStudents(shortExamId);
  }
}
