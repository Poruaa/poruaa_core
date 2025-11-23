class CourseMaterial {
  final int id;
  final int courseId;
  final String title;
  final String? description;
  final String materialType;
  final String? url;
  final String? textContent;
  final int? duration;
  final int orderIndex;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;

  CourseMaterial({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,
    required this.materialType,
    this.url,
    this.textContent,
    this.duration,
    required this.orderIndex,
    required this.isPublic,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseMaterial.fromJson(Map<String, dynamic> json) {
    return CourseMaterial(
      id: json['id'] as int,
      courseId: json['course_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      materialType: json['material_type'] as String,
      url: json['url'] as String?,
      textContent: json['text_content'] as String?,
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
      'course_id': courseId,
      'title': title,
      'description': description,
      'material_type': materialType,
      'url': url,
      'text_content': textContent,
      'duration': duration,
      'order_index': orderIndex,
      'is_public': isPublic,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  CourseMaterial copyWith({
    int? id,
    int? courseId,
    String? title,
    String? description,
    String? materialType,
    String? url,
    String? textContent,
    int? duration,
    int? orderIndex,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseMaterial(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      materialType: materialType ?? this.materialType,
      url: url ?? this.url,
      textContent: textContent ?? this.textContent,
      duration: duration ?? this.duration,
      orderIndex: orderIndex ?? this.orderIndex,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CreateCourseMaterialInput {
  final String title;
  final String? description;
  final String materialType;
  final String? url;
  final String? textContent;
  final int? duration;
  final int? orderIndex;
  final bool? isPublic;

  CreateCourseMaterialInput({
    required this.title,
    this.description,
    required this.materialType,
    this.url,
    this.textContent,
    this.duration,
    this.orderIndex,
    this.isPublic,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'material_type': materialType,
      'url': url,
      'text_content': textContent,
      'duration': duration,
      'order_index': orderIndex,
      'is_public': isPublic,
    };
  }
}

class UpdateCourseMaterialInput {
  final String? title;
  final String? description;
  final String? url;
  final String? textContent;
  final int? duration;
  final int? orderIndex;
  final bool? isPublic;

  UpdateCourseMaterialInput({
    this.title,
    this.description,
    this.url,
    this.textContent,
    this.duration,
    this.orderIndex,
    this.isPublic,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (title != null) json['title'] = title;
    if (description != null) json['description'] = description;
    if (url != null) json['url'] = url;
    if (textContent != null) json['text_content'] = textContent;
    if (duration != null) json['duration'] = duration;
    if (orderIndex != null) json['order_index'] = orderIndex;
    if (isPublic != null) json['is_public'] = isPublic;
    return json;
  }
}

class MaterialOrder {
  final int materialId;
  final int orderIndex;

  MaterialOrder({required this.materialId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'material_id': materialId, 'order_index': orderIndex};
  }
}

class ReorderMaterialsInput {
  final List<MaterialOrder> materialOrders;

  ReorderMaterialsInput({required this.materialOrders});

  Map<String, dynamic> toJson() {
    return {
      'material_orders': materialOrders.map((order) => order.toJson()).toList(),
    };
  }
}

enum MaterialType {
  youtubeVideo('youtube_video'),
  facebookVideo('facebook_video'),
  externalLink('external_link'),
  textContent('text_content');

  const MaterialType(this.value);
  final String value;

  static MaterialType fromString(String value) {
    return MaterialType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => MaterialType.textContent,
    );
  }

  String get displayName {
    switch (this) {
      case MaterialType.youtubeVideo:
        return 'YouTube Video';
      case MaterialType.facebookVideo:
        return 'Facebook Video';
      case MaterialType.externalLink:
        return 'External Link';
      case MaterialType.textContent:
        return 'Text Content';
    }
  }

  String get icon {
    switch (this) {
      case MaterialType.youtubeVideo:
        return '🎥';
      case MaterialType.facebookVideo:
        return '📺';
      case MaterialType.externalLink:
        return '🔗';
      case MaterialType.textContent:
        return '📄';
    }
  }
}
