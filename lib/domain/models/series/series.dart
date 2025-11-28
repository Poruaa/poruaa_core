class Series {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  Series({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      orderIndex: json['order_index'] as int,
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
      'order_index': orderIndex,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Series copyWith({
    int? id,
    int? teacherId,
    String? name,
    String? description,
    String? thumbnail,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Series(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SeriesDTO {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final int courseCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  SeriesDTO({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    required this.orderIndex,
    required this.courseCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SeriesDTO.fromJson(Map<String, dynamic> json) {
    return SeriesDTO(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      orderIndex: json['order_index'] as int,
      courseCount: json['course_count'] as int,
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
      'order_index': orderIndex,
      'course_count': courseCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class CourseInSeriesDTO {
  final int id;
  final int courseId;
  final int orderIndex;
  final String name;
  final String? subTitle;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime expiresAt;
  final DateTime? publishedAt;
  final double rating;
  final int enrollmentCount;
  final double price;
  final double? regularPrice;
  final bool isUnlisted;
  final int examCount;
  final int materialCount;

  CourseInSeriesDTO({
    required this.id,
    required this.courseId,
    required this.orderIndex,
    required this.name,
    this.subTitle,
    this.thumbnail,
    required this.createdAt,
    required this.expiresAt,
    this.publishedAt,
    required this.rating,
    required this.enrollmentCount,
    required this.price,
    this.regularPrice,
    required this.isUnlisted,
    required this.examCount,
    required this.materialCount,
  });

  factory CourseInSeriesDTO.fromJson(Map<String, dynamic> json) {
    return CourseInSeriesDTO(
      id: json['id'] as int,
      courseId: json['course_id'] as int,
      orderIndex: json['order_index'] as int,
      name: json['name'] as String,
      subTitle: json['sub_title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'] as String)
          : null,
      rating: (json['rating'] as num).toDouble(),
      enrollmentCount: json['enrollment_count'] as int,
      price: (json['price'] as num).toDouble(),
      regularPrice: json['regular_price'] != null
          ? (json['regular_price'] as num).toDouble()
          : null,
      isUnlisted: json['is_unlisted'] as bool,
      examCount: json['exam_count'] as int,
      materialCount: json['material_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'order_index': orderIndex,
      'name': name,
      'sub_title': subTitle,
      'thumbnail': thumbnail,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
      'rating': rating,
      'enrollment_count': enrollmentCount,
      'price': price,
      'regular_price': regularPrice,
      'is_unlisted': isUnlisted,
      'exam_count': examCount,
      'material_count': materialCount,
    };
  }
}

class SeriesWithCoursesDTO {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<CourseInSeriesDTO> courses;

  SeriesWithCoursesDTO({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
    required this.courses,
  });

  factory SeriesWithCoursesDTO.fromJson(Map<String, dynamic> json) {
    return SeriesWithCoursesDTO(
      id: json['id'] as int,
      teacherId: json['teacher_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      orderIndex: json['order_index'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      courses: (json['courses'] as List<dynamic>)
          .map(
            (course) =>
                CourseInSeriesDTO.fromJson(course as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher_id': teacherId,
      'name': name,
      'description': description,
      'thumbnail': thumbnail,
      'order_index': orderIndex,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'courses': courses.map((course) => course.toJson()).toList(),
    };
  }
}

class CreateSeriesInput {
  final String name;
  final String? description;
  final String? thumbnail;

  CreateSeriesInput({required this.name, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'thumbnail': thumbnail};
  }
}

class UpdateSeriesInput {
  final String? name;
  final String? description;
  final String? thumbnail;

  UpdateSeriesInput({this.name, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;
    if (description != null) json['description'] = description;
    if (thumbnail != null) json['thumbnail'] = thumbnail;
    return json;
  }
}

class SeriesOrder {
  final int seriesId;
  final int orderIndex;

  SeriesOrder({required this.seriesId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'series_id': seriesId, 'order_index': orderIndex};
  }
}

class ReorderSeriesInput {
  final List<SeriesOrder> seriesOrders;

  ReorderSeriesInput({required this.seriesOrders});

  Map<String, dynamic> toJson() {
    return {
      'series_orders': seriesOrders.map((order) => order.toJson()).toList(),
    };
  }
}

class AddCourseToSeriesInput {
  final int courseId;
  final int? orderIndex;

  AddCourseToSeriesInput({required this.courseId, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'course_id': courseId, 'order_index': orderIndex};
  }
}

class CourseOrder {
  final int courseId;
  final int orderIndex;

  CourseOrder({required this.courseId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'course_id': courseId, 'order_index': orderIndex};
  }
}

class ReorderCoursesInSeriesInput {
  final List<CourseOrder> courseOrders;

  ReorderCoursesInSeriesInput({required this.courseOrders});

  Map<String, dynamic> toJson() {
    return {
      'course_orders': courseOrders.map((order) => order.toJson()).toList(),
    };
  }
}
