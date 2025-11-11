/// Utility functions for rating calculations
class RatingUtils {
  /// Calculate total number of ratings from star counts
  static int getTotalRatings({
    required int star1Count,
    required int star2Count,
    required int star3Count,
    required int star4Count,
    required int star5Count,
  }) {
    return star1Count + star2Count + star3Count + star4Count + star5Count;
  }

  /// Calculate average rating from star counts
  static double getAverageRating({
    required int star1Count,
    required int star2Count,
    required int star3Count,
    required int star4Count,
    required int star5Count,
  }) {
    final totalRatings = getTotalRatings(
      star1Count: star1Count,
      star2Count: star2Count,
      star3Count: star3Count,
      star4Count: star4Count,
      star5Count: star5Count,
    );

    if (totalRatings == 0) return 0.0;

    final weightedSum = (star1Count * 1) +
        (star2Count * 2) +
        (star3Count * 3) +
        (star4Count * 4) +
        (star5Count * 5);

    return weightedSum / totalRatings;
  }

  /// Get rating distribution as percentages
  static Map<int, double> getRatingDistribution({
    required int star1Count,
    required int star2Count,
    required int star3Count,
    required int star4Count,
    required int star5Count,
  }) {
    final totalRatings = getTotalRatings(
      star1Count: star1Count,
      star2Count: star2Count,
      star3Count: star3Count,
      star4Count: star4Count,
      star5Count: star5Count,
    );

    if (totalRatings == 0) {
      return {1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0};
    }

    return {
      1: (star1Count / totalRatings) * 100,
      2: (star2Count / totalRatings) * 100,
      3: (star3Count / totalRatings) * 100,
      4: (star4Count / totalRatings) * 100,
      5: (star5Count / totalRatings) * 100,
    };
  }

  /// Get star counts as a list for easy iteration
  static List<int> getStarCounts({
    required int star1Count,
    required int star2Count,
    required int star3Count,
    required int star4Count,
    required int star5Count,
  }) {
    return [star1Count, star2Count, star3Count, star4Count, star5Count];
  }
}
