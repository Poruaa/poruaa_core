import 'package:poruaa_core/data/repositories/series/series_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/series/series_service.dart';
import 'package:poruaa_core/domain/models/series/series.dart';
import 'package:poruaa_core/utils/result.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesService _seriesService;
  final UserRepository _userRepository;

  SeriesRepositoryImpl(this._seriesService, this._userRepository);

  @override
  Future<Result<List<SeriesDTO>>> getAllSeries(int teacherId) async {
    return await _seriesService.getAllSeries(teacherId);
  }

  @override
  Future<Result<Series>> getSeriesById(int seriesId) async {
    return await _seriesService.getSeriesById(seriesId);
  }

  @override
  Future<Result<SeriesWithCoursesDTO>> getSeriesWithCourses(
    int seriesId,
  ) async {
    return await _seriesService.getSeriesWithCourses(seriesId);
  }

  @override
  Future<Result<Series>> createSeries(CreateSeriesInput input) async {
    return await _seriesService.createSeries(
      _userRepository.getCurrentUserId,
      input,
    );
  }

  @override
  Future<Result<Series>> updateSeries(
    int seriesId,
    UpdateSeriesInput input,
  ) async {
    return await _seriesService.updateSeries(
      _userRepository.getCurrentUserId,
      seriesId,
      input,
    );
  }

  @override
  Future<Result<Series>> deleteSeries(int seriesId) async {
    return await _seriesService.deleteSeries(
      _userRepository.getCurrentUserId,
      seriesId,
    );
  }

  @override
  Future<Result<void>> reorderSeries(ReorderSeriesInput input) async {
    return await _seriesService.reorderSeries(
      _userRepository.getCurrentUserId,
      input,
    );
  }

  @override
  Future<Result<void>> addCourseToSeries(
    int seriesId,
    AddCourseToSeriesInput input,
  ) async {
    return await _seriesService.addCourseToSeries(
      _userRepository.getCurrentUserId,
      seriesId,
      input,
    );
  }

  @override
  Future<Result<void>> removeCourseFromSeries(
    int seriesId,
    int courseId,
  ) async {
    return await _seriesService.removeCourseFromSeries(
      _userRepository.getCurrentUserId,
      seriesId,
      courseId,
    );
  }

  @override
  Future<Result<void>> reorderCoursesInSeries(
    int seriesId,
    ReorderCoursesInSeriesInput input,
  ) async {
    return await _seriesService.reorderCoursesInSeries(
      _userRepository.getCurrentUserId,
      seriesId,
      input,
    );
  }
}
