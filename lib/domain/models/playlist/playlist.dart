class Playlist {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime updatedAt;

  Playlist({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher_id': teacherId,
      'name': name,
      'description': description,
      'thumbnail': thumbnail,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Playlist copyWith({
    int? id,
    int? teacherId,
    String? name,
    String? description,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Playlist(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class Video {
  final int id;
  final int playlistId;
  final String title;
  final String? description;
  final VideoType videoType;
  final String cdnType;
  final String videoUrl;
  final String? thumbnail;
  final int? duration;
  final int orderIndex;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;

  Video({
    required this.id,
    required this.playlistId,
    required this.title,
    this.description,
    required this.videoType,
    required this.cdnType,
    required this.videoUrl,
    this.thumbnail,
    this.duration,
    required this.orderIndex,
    required this.isPublic,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as int,
      playlistId: json['playlist_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      videoType: VideoType.fromString(json['video_type'] as String),
      cdnType: json['cdn_type'] as String,
      videoUrl: json['video_url'] as String,
      thumbnail: json['thumbnail'] as String?,
      duration: json['duration'] as int?,
      orderIndex: json['order_index'] as int,
      isPublic: json['is_public'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playlist_id': playlistId,
      'title': title,
      'description': description,
      'video_type': videoType.value,
      'cdn_type': cdnType,
      'video_url': videoUrl,
      'thumbnail': thumbnail,
      'duration': duration,
      'order_index': orderIndex,
      'is_public': isPublic,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Video copyWith({
    int? id,
    int? playlistId,
    String? title,
    String? description,
    VideoType? videoType,
    String? cdnType,
    String? videoUrl,
    String? thumbnail,
    int? duration,
    int? orderIndex,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Video(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      title: title ?? this.title,
      description: description ?? this.description,
      videoType: videoType ?? this.videoType,
      cdnType: cdnType ?? this.cdnType,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnail: thumbnail ?? this.thumbnail,
      duration: duration ?? this.duration,
      orderIndex: orderIndex ?? this.orderIndex,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CreatePlaylistInput {
  final String name;
  final String? description;
  final String? thumbnail;

  CreatePlaylistInput({required this.name, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'thumbnail': thumbnail};
  }
}

class UpdatePlaylistInput {
  final String? name;
  final String? description;
  final String? thumbnail;

  UpdatePlaylistInput({this.name, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;
    if (description != null) json['description'] = description;
    if (thumbnail != null) json['thumbnail'] = thumbnail;
    return json;
  }
}

class CreateVideoInput {
  final String title;
  final String? description;
  final VideoType videoType;
  final String cdnType;
  final String videoUrl;
  final String? thumbnail;
  final int? duration;
  final int? orderIndex;
  final bool? isPublic;

  CreateVideoInput({
    required this.title,
    this.description,
    required this.videoType,
    required this.cdnType,
    required this.videoUrl,
    this.thumbnail,
    this.duration,
    this.orderIndex,
    this.isPublic,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'video_type': videoType.value,
      'cdn_type': cdnType,
      'video_url': videoUrl,
      'thumbnail': thumbnail,
      'duration': duration,
      'order_index': orderIndex,
      'is_public': isPublic,
    };
  }
}

class UpdateVideoInput {
  final String? title;
  final String? description;
  final VideoType? videoType;
  final String? cdnType;
  final String? videoUrl;
  final String? thumbnail;
  final int? duration;
  final int? orderIndex;
  final bool? isPublic;

  UpdateVideoInput({
    this.title,
    this.description,
    this.videoType,
    this.cdnType,
    this.videoUrl,
    this.thumbnail,
    this.duration,
    this.orderIndex,
    this.isPublic,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (title != null) json['title'] = title;
    if (description != null) json['description'] = description;
    if (videoType != null) json['video_type'] = videoType!.value;
    if (cdnType != null) json['cdn_type'] = cdnType;
    if (videoUrl != null) json['video_url'] = videoUrl;
    if (thumbnail != null) json['thumbnail'] = thumbnail;
    if (duration != null) json['duration'] = duration;
    if (orderIndex != null) json['order_index'] = orderIndex;
    if (isPublic != null) json['is_public'] = isPublic;
    return json;
  }
}

class AttachPlaylistToCourseInput {
  final int playlistId;
  final int? orderIndex;

  AttachPlaylistToCourseInput({required this.playlistId, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'playlist_id': playlistId, 'order_index': orderIndex};
  }
}

class VideoOrder {
  final int videoId;
  final int orderIndex;

  VideoOrder({required this.videoId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'video_id': videoId, 'order_index': orderIndex};
  }
}

class ReorderVideosInput {
  final List<VideoOrder> videoOrders;

  ReorderVideosInput({required this.videoOrders});

  Map<String, dynamic> toJson() {
    return {
      'video_orders': videoOrders.map((order) => order.toJson()).toList(),
    };
  }
}

enum VideoType {
  live('live'),
  preRecorded('pre-recorded');

  const VideoType(this.value);
  final String value;

  static VideoType fromString(String value) {
    return VideoType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => VideoType.preRecorded,
    );
  }

  String get displayName {
    switch (this) {
      case VideoType.live:
        return 'Live';
      case VideoType.preRecorded:
        return 'Pre-recorded';
    }
  }

  String get icon {
    switch (this) {
      case VideoType.live:
        return '🔴';
      case VideoType.preRecorded:
        return '▶️';
    }
  }
}

enum CdnType {
  cloudflare('cloudflare'),
  aws('aws'),
  youtube('youtube'),
  vimeo('vimeo'),
  other('other');

  const CdnType(this.value);
  final String value;

  static CdnType fromString(String value) {
    return CdnType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => CdnType.other,
    );
  }

  String get displayName {
    switch (this) {
      case CdnType.cloudflare:
        return 'Cloudflare';
      case CdnType.aws:
        return 'AWS';
      case CdnType.youtube:
        return 'YouTube';
      case CdnType.vimeo:
        return 'Vimeo';
      case CdnType.other:
        return 'Other';
    }
  }
}
