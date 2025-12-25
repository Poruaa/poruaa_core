import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/cache_database.dart';

part 'notification_topic_cache_dao.g.dart';

@DriftAccessor(tables: [NotificationTopics])
class NotificationTopicCacheDao extends DatabaseAccessor<CacheDatabase>
    with _$NotificationTopicCacheDaoMixin {
  NotificationTopicCacheDao(super.db);

  /// Insert or update a notification topic for a user
  Future<void> insertOrUpdateTopic(int userId, String topic) async {
    final companion = NotificationTopicsCompanion(
      userId: Value(userId),
      topic: Value(topic),
    );

    await into(notificationTopics).insertOnConflictUpdate(companion);
  }

  /// Get all topics for a user
  Future<List<String>> getTopicsForUser(int userId) async {
    final query = select(notificationTopics)
      ..where((tbl) => tbl.userId.equals(userId));

    final results = await query.get();
    return results.map((row) => row.topic).toList();
  }

  /// Check if a topic exists for a user
  Future<bool> hasTopic(String topic) async {
    final query = selectOnly(notificationTopics)
      ..addColumns([notificationTopics.id.count()])
      ..where(notificationTopics.topic.equals(topic));

    final result = await query.getSingle();
    final count = result.read(notificationTopics.id.count());
    return count != null && count > 0;
  }

  /// Delete a topic for a user
  Future<int> deleteTopic(String topic) async {
    return await (delete(
      notificationTopics,
    )..where((tbl) => tbl.topic.equals(topic))).go();
  }

  /// Delete all topics for a user
  Future<int> deleteAllTopicsForUser(int userId) async {
    return await (delete(
      notificationTopics,
    )..where((tbl) => tbl.userId.equals(userId))).go();
  }

  Future<int> deleteAllTopics() async {
    return await delete(notificationTopics).go();
  }

  /// Get all notification topics (for debugging/maintenance)
  Future<List<NotificationTopic>> getAllTopics() async {
    final query = select(notificationTopics);
    return await query.get();
  }

  /// Watch if a topic exists
  Stream<bool> hasTopicWatch(String topic) {
    final query = selectOnly(notificationTopics)
      ..addColumns([notificationTopics.id.count()])
      ..where(notificationTopics.topic.equals(topic));

    return query.watchSingle().map((row) {
      final count = row.read(notificationTopics.id.count());
      return count != null && count > 0;
    });
  }

  /// Watch all notification topics
  Stream<List<NotificationTopic>> watchAllTopics() {
    return select(notificationTopics).watch();
  }
}
