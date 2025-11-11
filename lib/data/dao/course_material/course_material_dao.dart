import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';

part 'course_material_dao.g.dart';

@DriftAccessor(tables: [CourseMaterialItems])
class CourseMaterialDao extends DatabaseAccessor<AppDatabase>
    with _$CourseMaterialDaoMixin {
  CourseMaterialDao(super.db);

  Future<List<CourseMaterialItem>> getCourseMaterials(int courseId) {
    return (select(courseMaterialItems)
          ..where((tbl) => tbl.courseId.equals(courseId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .get();
  }

  Future<CourseMaterialItem?> getCourseMaterial(int courseId, int materialId) {
    return (select(courseMaterialItems)..where(
          (tbl) => tbl.courseId.equals(courseId) & tbl.id.equals(materialId),
        ))
        .getSingleOrNull();
  }

  Future<int> insertCourseMaterial(CourseMaterialItem material) {
    return into(courseMaterialItems).insert(material);
  }

  Future<bool> updateCourseMaterial(CourseMaterialItem material) {
    return update(courseMaterialItems).replace(material);
  }

  Future<int> deleteCourseMaterial(int courseId, int materialId) {
    return (delete(courseMaterialItems)..where(
          (tbl) => tbl.courseId.equals(courseId) & tbl.id.equals(materialId),
        ))
        .go();
  }

  Future<void> reorderCourseMaterials(
    int courseId,
    List<MaterialOrder> orders,
  ) async {
    await batch((batch) {
      for (final order in orders) {
        batch.update(
          courseMaterialItems,
          CourseMaterialItemsCompanion(orderIndex: Value(order.orderIndex)),
          where: (tbl) =>
              tbl.courseId.equals(courseId) & tbl.id.equals(order.materialId),
        );
      }
    });
  }

  Future<int> getCourseMaterialCount(int courseId) {
    return (select(courseMaterialItems)
          ..where((tbl) => tbl.courseId.equals(courseId)))
        .get()
        .then((materials) => materials.length);
  }

  Future<void> clearCourseMaterials(int courseId) {
    return (delete(
      courseMaterialItems,
    )..where((tbl) => tbl.courseId.equals(courseId))).go();
  }
}
