import 'package:poruaa_core/domain/models/playlist/playlist.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class PlaylistRepository {
  // Playlist operations
  Future<Result<List<Playlist>>> getPlaylists();

  Future<Result<Playlist>> getPlaylist(int playlistId);

  Future<Result<Playlist>> createPlaylist(CreatePlaylistInput input);

  Future<Result<Playlist>> updatePlaylist(
    int playlistId,
    UpdatePlaylistInput input,
  );

  Future<Result<void>> deletePlaylist(int playlistId);

  // Video operations
  Future<Result<List<Video>>> getVideos(int playlistId);

  Future<Result<Video>> getVideo(int playlistId, int videoId);

  Future<Result<Video>> createVideo(int playlistId, CreateVideoInput input);

  Future<Result<Video>> updateVideo(
    int playlistId,
    int videoId,
    UpdateVideoInput input,
  );

  Future<Result<void>> deleteVideo(int playlistId, int videoId);

  Future<Result<void>> reorderVideos(int playlistId, ReorderVideosInput input);

  // Course-Playlist operations
  Future<Result<List<Playlist>>> getCoursePlaylists(int courseId);

  Future<Result<void>> attachPlaylistToCourse(
    int courseId,
    AttachPlaylistToCourseInput input,
  );

  Future<Result<void>> detachPlaylistFromCourse(int courseId, int playlistId);

  // Student endpoints
  /// Get all playlists for a course (student view)
  Future<Result<List<Playlist>>> getCoursePlaylistsForStudent(int courseId);

  /// Get all videos in a playlist for a course (student view)
  Future<Result<List<Video>>> getPlaylistVideosForStudent(
    int courseId,
    int playlistId,
  );

  /// Get a specific video in a playlist for a course (student view)
  Future<Result<Video>> getVideoForStudent(
    int courseId,
    int playlistId,
    int videoId,
  );
}
