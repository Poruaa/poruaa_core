import 'package:poruaa_core/data/repositories/playlist/playlist_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/playlist/playlist_service.dart';
import 'package:poruaa_core/domain/models/playlist/playlist.dart';
import 'package:poruaa_core/utils/result.dart';

class PlaylistRepositoryImpl implements PlaylistRepository {
  final PlaylistService _playlistService;
  final UserRepository _userRepository;

  PlaylistRepositoryImpl(
    this._playlistService,
    this._userRepository,
  );

  @override
  Future<Result<List<Playlist>>> getPlaylists() async {
    return await _playlistService.getPlaylists(
      _userRepository.getCurrentUserId,
    );
  }

  @override
  Future<Result<Playlist>> getPlaylist(int playlistId) async {
    return await _playlistService.getPlaylist(
      _userRepository.getCurrentUserId,
      playlistId,
    );
  }

  @override
  Future<Result<Playlist>> createPlaylist(CreatePlaylistInput input) async {
    return await _playlistService.createPlaylist(
      _userRepository.getCurrentUserId,
      input,
    );
  }

  @override
  Future<Result<Playlist>> updatePlaylist(
    int playlistId,
    UpdatePlaylistInput input,
  ) async {
    return await _playlistService.updatePlaylist(
      _userRepository.getCurrentUserId,
      playlistId,
      input,
    );
  }

  @override
  Future<Result<void>> deletePlaylist(int playlistId) async {
    return await _playlistService.deletePlaylist(
      _userRepository.getCurrentUserId,
      playlistId,
    );
  }

  @override
  Future<Result<List<Video>>> getVideos(int playlistId) async {
    return await _playlistService.getVideos(
      _userRepository.getCurrentUserId,
      playlistId,
    );
  }

  @override
  Future<Result<Video>> getVideo(int playlistId, int videoId) async {
    return await _playlistService.getVideo(
      _userRepository.getCurrentUserId,
      playlistId,
      videoId,
    );
  }

  @override
  Future<Result<Video>> createVideo(
    int playlistId,
    CreateVideoInput input,
  ) async {
    return await _playlistService.createVideo(
      _userRepository.getCurrentUserId,
      playlistId,
      input,
    );
  }

  @override
  Future<Result<Video>> updateVideo(
    int playlistId,
    int videoId,
    UpdateVideoInput input,
  ) async {
    return await _playlistService.updateVideo(
      _userRepository.getCurrentUserId,
      playlistId,
      videoId,
      input,
    );
  }

  @override
  Future<Result<void>> deleteVideo(int playlistId, int videoId) async {
    return await _playlistService.deleteVideo(
      _userRepository.getCurrentUserId,
      playlistId,
      videoId,
    );
  }

  @override
  Future<Result<void>> reorderVideos(
    int playlistId,
    ReorderVideosInput input,
  ) async {
    return await _playlistService.reorderVideos(
      _userRepository.getCurrentUserId,
      playlistId,
      input,
    );
  }

  @override
  Future<Result<List<Playlist>>> getCoursePlaylists(int courseId) async {
    return await _playlistService.getCoursePlaylists(
      _userRepository.getCurrentUserId,
      courseId,
    );
  }

  @override
  Future<Result<void>> attachPlaylistToCourse(
    int courseId,
    AttachPlaylistToCourseInput input,
  ) async {
    return await _playlistService.attachPlaylistToCourse(
      _userRepository.getCurrentUserId,
      courseId,
      input,
    );
  }

  @override
  Future<Result<void>> detachPlaylistFromCourse(
    int courseId,
    int playlistId,
  ) async {
    return await _playlistService.detachPlaylistFromCourse(
      _userRepository.getCurrentUserId,
      courseId,
      playlistId,
    );
  }

  @override
  Future<Result<List<Playlist>>> getCoursePlaylistsForStudent(
    int courseId,
  ) async {
    return await _playlistService.getCoursePlaylistsForStudent(courseId);
  }

  @override
  Future<Result<List<Video>>> getPlaylistVideosForStudent(
    int courseId,
    int playlistId,
  ) async {
    return await _playlistService.getPlaylistVideosForStudent(
      courseId,
      playlistId,
    );
  }

  @override
  Future<Result<Video>> getVideoForStudent(
    int courseId,
    int playlistId,
    int videoId,
  ) async {
    return await _playlistService.getVideoForStudent(
      courseId,
      playlistId,
      videoId,
    );
  }
}

