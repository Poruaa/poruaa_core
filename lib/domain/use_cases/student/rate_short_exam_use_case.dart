import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/domain/models/rating/short_exam_rating.dart';
import 'package:poruaa_core/utils/result.dart';

class RateShortExamUseCase {
  final RatingRepository _ratingRepository;

  RateShortExamUseCase(this._ratingRepository);

  Future<Result<ShortExamRating>> execute({
    required int shortExamId,
    required int rating,
    String? review,
  }) async {
    // Validate rating range
    if (rating < 1 || rating > 5) {
      return Result.error('Rating must be between 1 and 5');
    }

    return await _ratingRepository.createShortExamRating(
      shortExamId,
      rating,
      review,
    );
  }
}
