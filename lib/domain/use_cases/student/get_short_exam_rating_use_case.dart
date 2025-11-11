import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating.dart';
import 'package:poruaa_core/utils/result.dart';

class GetShortExamRatingUseCase {
  final RatingRepository _ratingRepository;

  GetShortExamRatingUseCase(this._ratingRepository);

  Future<Result<ShortExamRating?>> execute(int shortExamId) async {
    return await _ratingRepository.getShortExamRatingByStudent(shortExamId);
  }
}
