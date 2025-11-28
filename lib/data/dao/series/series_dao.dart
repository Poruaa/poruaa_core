import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/domain/models/series/series.dart';

part 'series_dao.g.dart';

@DriftAccessor(tables: [SeriesItems, CourseSeriesItems])
class SeriesDao extends DatabaseAccessor<AppDatabase> with _$SeriesDaoMixin {
  SeriesDao(super.db);

  // Series operations
  Future<List<SeriesItem>> getSeries(int teacherId) {
    return (select(seriesItems)
          ..where((tbl) => tbl.teacherId.equals(teacherId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .get();
  }

  Future<SeriesItem?> getSeriesById(int seriesId) {
    return (select(
      seriesItems,
    )..where((tbl) => tbl.id.equals(seriesId))).getSingleOrNull();
  }

  Future<int> insertSeries(SeriesItem series) {
    return into(seriesItems).insert(series);
  }

  Future<bool> updateSeries(SeriesItem series) {
    return update(seriesItems).replace(series);
  }

  Future<int> deleteSeries(int teacherId, int seriesId) {
    return (delete(seriesItems)..where(
          (tbl) => tbl.teacherId.equals(teacherId) & tbl.id.equals(seriesId),
        ))
        .go();
  }

  Future<void> reorderSeries(int teacherId, List<SeriesOrder> orders) async {
    await batch((batch) {
      for (final order in orders) {
        batch.update(
          seriesItems,
          SeriesItemsCompanion(orderIndex: Value(order.orderIndex)),
          where: (tbl) =>
              tbl.teacherId.equals(teacherId) & tbl.id.equals(order.seriesId),
        );
      }
    });
  }

  // Course-Series operations
  Future<int> addCourseToSeries(CourseSeriesItem item) {
    return into(courseSeriesItems).insert(item);
  }

  Future<int> removeCourseFromSeries(int seriesId, int courseId) {
    return (delete(courseSeriesItems)..where(
          (tbl) =>
              tbl.seriesId.equals(seriesId) & tbl.courseId.equals(courseId),
        ))
        .go();
  }

  Future<void> reorderCoursesInSeries(
    int seriesId,
    List<CourseOrder> orders,
  ) async {
    await batch((batch) {
      for (final order in orders) {
        batch.update(
          courseSeriesItems,
          CourseSeriesItemsCompanion(orderIndex: Value(order.orderIndex)),
          where: (tbl) =>
              tbl.seriesId.equals(seriesId) &
              tbl.courseId.equals(order.courseId),
        );
      }
    });
  }

  Future<void> clearSeriesCourses(int seriesId) {
    return (delete(
      courseSeriesItems,
    )..where((tbl) => tbl.seriesId.equals(seriesId))).go();
  }
}
