import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/playlist/playlist_service.dart';
import 'package:poruaa_core/domain/models/playlist/playlist.dart';
import 'package:poruaa_core/utils/result.dart';

class PlaylistServiceImpl implements PlaylistService {
  final ApiService _apiService;

  PlaylistServiceImpl(this._apiService);

  @override
  Future<Result<List<Playlist>>> getPlaylists(int teacherId) async {
    try {
      final result = await _apiService.get('teachers/$teacherId/playlists');
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final playlists = jsonList
              .map((json) => Playlist.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(playlists);
        } else {
          return Result.error(
            'Failed to fetch playlists: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching playlists: $e');
    }
  }

  @override
  Future<Result<Playlist>> getPlaylist(int teacherId, int playlistId) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/playlists/$playlistId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final playlist = Playlist.fromJson(json);
          return Result.ok(playlist);
        } else {
          return Result.error(
            'Failed to fetch playlist: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching playlist: $e');
    }
  }

  @override
  Future<Result<Playlist>> createPlaylist(
    int teacherId,
    CreatePlaylistInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/playlists',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final playlist = Playlist.fromJson(json);
          return Result.ok(playlist);
        } else {
          return Result.error(
            'Failed to create playlist: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error creating playlist: $e');
    }
  }

  @override
  Future<Result<Playlist>> updatePlaylist(
    int teacherId,
    int playlistId,
    UpdatePlaylistInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.put(
        'teachers/$teacherId/playlists/$playlistId',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final playlist = Playlist.fromJson(json);
          return Result.ok(playlist);
        } else {
          return Result.error(
            'Failed to update playlist: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error updating playlist: $e');
    }
  }

  @override
  Future<Result<void>> deletePlaylist(int teacherId, int playlistId) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/playlists/$playlistId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to delete playlist: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error deleting playlist: $e');
    }
  }

  @override
  Future<Result<List<Video>>> getVideos(int teacherId, int playlistId) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/playlists/$playlistId/videos',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final videos = jsonList
              .map((json) => Video.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(videos);
        } else {
          return Result.error('Failed to fetch videos: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching videos: $e');
    }
  }

  @override
  Future<Result<Video>> getVideo(
    int teacherId,
    int playlistId,
    int videoId,
  ) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/playlists/$playlistId/videos/$videoId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final video = Video.fromJson(json);
          return Result.ok(video);
        } else {
          return Result.error('Failed to fetch video: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching video: $e');
    }
  }

  @override
  Future<Result<Video>> createVideo(
    int teacherId,
    int playlistId,
    CreateVideoInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/playlists/$playlistId/videos',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final video = Video.fromJson(json);
          return Result.ok(video);
        } else {
          return Result.error('Failed to create video: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error creating video: $e');
    }
  }

  @override
  Future<Result<Video>> updateVideo(
    int teacherId,
    int playlistId,
    int videoId,
    UpdateVideoInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.put(
        'teachers/$teacherId/playlists/$playlistId/videos/$videoId',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final video = Video.fromJson(json);
          return Result.ok(video);
        } else {
          return Result.error('Failed to update video: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error updating video: $e');
    }
  }

  @override
  Future<Result<void>> deleteVideo(
    int teacherId,
    int playlistId,
    int videoId,
  ) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/playlists/$playlistId/videos/$videoId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error('Failed to delete video: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error deleting video: $e');
    }
  }

  @override
  Future<Result<void>> reorderVideos(
    int teacherId,
    int playlistId,
    ReorderVideosInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/playlists/$playlistId/videos/reorder',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to reorder videos: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error reordering videos: $e');
    }
  }

  @override
  Future<Result<List<Playlist>>> getCoursePlaylists(
    int teacherId,
    int courseId,
  ) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/courses/$courseId/playlists',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final playlists = jsonList
              .map((json) => Playlist.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(playlists);
        } else {
          return Result.error(
            'Failed to fetch course playlists: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching course playlists: $e');
    }
  }

  @override
  Future<Result<void>> attachPlaylistToCourse(
    int teacherId,
    int courseId,
    AttachPlaylistToCourseInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/courses/$courseId/playlists',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to attach playlist to course: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error attaching playlist to course: $e');
    }
  }

  @override
  Future<Result<void>> detachPlaylistFromCourse(
    int teacherId,
    int courseId,
    int playlistId,
  ) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/courses/$courseId/playlists/$playlistId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to detach playlist from course: ${response.statusCode}, ${response.body}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error detaching playlist from course: $e');
    }
  }

  @override
  Future<Result<List<Playlist>>> getCoursePlaylistsForStudent(
    int courseId,
  ) async {
    try {
      final result = await _apiService.get(
        'students/me/courses/$courseId/playlists',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final playlists = jsonList
              .map((json) => Playlist.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(playlists);
        } else {
          return Result.error(
            'Failed to fetch course playlists: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching course playlists: $e');
    }
  }

  @override
  Future<Result<List<Video>>> getPlaylistVideosForStudent(
    int courseId,
    int playlistId,
  ) async {
    try {
      final result = await _apiService.get(
        'students/me/courses/$courseId/playlists/$playlistId/videos',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final videos = jsonList
              .map((json) => Video.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(videos);
        } else {
          return Result.error(
            'Failed to fetch playlist videos: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching playlist videos: $e');
    }
  }

  @override
  Future<Result<Video>> getVideoForStudent(
    int courseId,
    int playlistId,
    int videoId,
  ) async {
    try {
      final result = await _apiService.get(
        'students/me/courses/$courseId/playlists/$playlistId/videos/$videoId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final video = Video.fromJson(json);
          return Result.ok(video);
        } else {
          return Result.error('Failed to fetch video: ${response.statusCode}');
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching video: $e');
    }
  }
}
