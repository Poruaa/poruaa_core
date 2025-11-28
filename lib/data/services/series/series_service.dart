import 'package:poruaa_core/domain/models/series/series.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class SeriesService {
  // Public routes
  /// Get all series for a teacher
  Future<Result<List<SeriesDTO>>> getAllSeries(int teacherId);

  /// Get series by ID
  Future<Result<Series>> getSeriesById(int seriesId);

  /// Get series with courses
  Future<Result<SeriesWithCoursesDTO>> getSeriesWithCourses(int seriesId);

  // Protected routes (teacher authentication required)
  /// Create series
  Future<Result<Series>> createSeries(int teacherId, CreateSeriesInput input);

  /// Update series
  Future<Result<Series>> updateSeries(
    int teacherId,
    int seriesId,
    UpdateSeriesInput input,
  );

  /// Delete series
  Future<Result<Series>> deleteSeries(int teacherId, int seriesId);

  /// Reorder series
  Future<Result<void>> reorderSeries(int teacherId, ReorderSeriesInput input);

  /// Add course to series
  Future<Result<void>> addCourseToSeries(
    int teacherId,
    int seriesId,
    AddCourseToSeriesInput input,
  );

  /// Remove course from series
  Future<Result<void>> removeCourseFromSeries(
    int teacherId,
    int seriesId,
    int courseId,
  );

  /// Reorder courses in series
  Future<Result<void>> reorderCoursesInSeries(
    int teacherId,
    int seriesId,
    ReorderCoursesInSeriesInput input,
  );
}
