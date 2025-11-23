import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/domain/models/playlist/playlist.dart';

part 'playlist_dao.g.dart';

@DriftAccessor(tables: [PlaylistItems, VideoItems, CoursePlaylistItems])
class PlaylistDao extends DatabaseAccessor<AppDatabase>
    with _$PlaylistDaoMixin {
  PlaylistDao(super.db);

  // Playlist operations
  Future<List<PlaylistItem>> getPlaylists(int teacherId) {
    return (select(
      playlistItems,
    )..where((tbl) => tbl.teacherId.equals(teacherId))).get();
  }

  Future<PlaylistItem?> getPlaylist(int teacherId, int playlistId) {
    return (select(playlistItems)..where(
          (tbl) => tbl.teacherId.equals(teacherId) & tbl.id.equals(playlistId),
        ))
        .getSingleOrNull();
  }

  Future<int> insertPlaylist(PlaylistItem playlist) {
    return into(playlistItems).insert(playlist);
  }

  Future<bool> updatePlaylist(PlaylistItem playlist) {
    return update(playlistItems).replace(playlist);
  }

  Future<int> deletePlaylist(int teacherId, int playlistId) {
    return (delete(playlistItems)..where(
          (tbl) => tbl.teacherId.equals(teacherId) & tbl.id.equals(playlistId),
        ))
        .go();
  }

  // Video operations
  Future<List<VideoItem>> getVideos(int playlistId) {
    return (select(videoItems)
          ..where((tbl) => tbl.playlistId.equals(playlistId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderIndex)]))
        .get();
  }

  Future<VideoItem?> getVideo(int playlistId, int videoId) {
    return (select(videoItems)..where(
          (tbl) => tbl.playlistId.equals(playlistId) & tbl.id.equals(videoId),
        ))
        .getSingleOrNull();
  }

  Future<int> insertVideo(VideoItem video) {
    return into(videoItems).insert(video);
  }

  Future<bool> updateVideo(VideoItem video) {
    return update(videoItems).replace(video);
  }

  Future<int> deleteVideo(int playlistId, int videoId) {
    return (delete(videoItems)..where(
          (tbl) => tbl.playlistId.equals(playlistId) & tbl.id.equals(videoId),
        ))
        .go();
  }

  Future<void> reorderVideos(int playlistId, List<VideoOrder> orders) async {
    await batch((batch) {
      for (final order in orders) {
        batch.update(
          videoItems,
          VideoItemsCompanion(orderIndex: Value(order.orderIndex)),
          where: (tbl) =>
              tbl.playlistId.equals(playlistId) & tbl.id.equals(order.videoId),
        );
      }
    });
  }

  // Course-Playlist operations
  Future<List<PlaylistItem>> getCoursePlayLists(int courseId) async {
    final query =
        select(playlistItems).join([
            innerJoin(
              coursePlaylistItems,
              coursePlaylistItems.playlistId.equalsExp(playlistItems.id),
            ),
          ])
          ..where(coursePlaylistItems.courseId.equals(courseId))
          ..orderBy([OrderingTerm.asc(coursePlaylistItems.orderIndex)]);

    final results = await query.get();
    return results.map((row) => row.readTable(playlistItems)).toList();
  }

  Future<int> attachPlaylistToCourse(CoursePlaylistItem item) {
    return into(coursePlaylistItems).insert(item);
  }

  Future<int> detachPlaylistFromCourse(int courseId, int playlistId) {
    return (delete(coursePlaylistItems)..where(
          (tbl) =>
              tbl.courseId.equals(courseId) & tbl.playlistId.equals(playlistId),
        ))
        .go();
  }

  Future<void> clearCoursePlaylists(int courseId) {
    return (delete(
      coursePlaylistItems,
    )..where((tbl) => tbl.courseId.equals(courseId))).go();
  }

  Future<void> clearPlaylistVideos(int playlistId) {
    return (delete(
      videoItems,
    )..where((tbl) => tbl.playlistId.equals(playlistId))).go();
  }
}
