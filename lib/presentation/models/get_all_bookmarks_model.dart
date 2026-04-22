class GetAllBookmarksModel {
  final List<Enrollment> data;
  final int statusCode;
  final String timestamp;

  GetAllBookmarksModel({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory GetAllBookmarksModel.fromJson(Map<String, dynamic> json) {
    return GetAllBookmarksModel(
      data: (json['data'] as List? ?? []).map((e) => Enrollment.fromJson(e)).toList(),
      statusCode: json['statusCode'] ?? 0,
      timestamp: json['timestamp'] ?? '',
    );
  }
}

class Enrollment {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BookMarkCourse course;

  Enrollment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.course,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      id: json['_id'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      course: BookMarkCourse.fromJson(json['course'] ?? {}),
    );
  }
}

class BookMarkCourse {
  final String id;
  final String name;
  final String description;
  final String? shortDescription;
  final double price;
  final String estimationTime;
  final String? coverImage;
  final String? thumbnailImage;
  final List<String> willLearn;
  final List<String> requirements;
  final List<String> targetAudience;
  final String? level;
  final Category? category;
  final List<String> chapters;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final int enrollmentsCount; // ✅ NEW

  BookMarkCourse({
    required this.id,
    required this.name,
    required this.description,
    this.shortDescription,
    required this.price,
    required this.estimationTime,
    this.coverImage,
    this.thumbnailImage,
    required this.willLearn,
    required this.requirements,
    required this.targetAudience,
    this.level,
    this.category,
    required this.chapters,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.enrollmentsCount,
  });

  factory BookMarkCourse.fromJson(Map<String, dynamic> json) {
    return BookMarkCourse(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['shortDescription'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      estimationTime: json['estimationTime'] ?? '',
      coverImage: json['coverImage'],
      thumbnailImage: json['thumbnailImage'],
      willLearn: List<String>.from(json['willLearn'] ?? []),
      requirements: List<String>.from(json['requirements'] ?? []),
      targetAudience: List<String>.from(json['targetAudience'] ?? []),
      level: json['level'],
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      chapters: List<String>.from(json['chapters'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'] ?? 0,
      enrollmentsCount: json['enrollmentsCount'] ?? 0, // ✅ NEW
    );
  }
}

class Category {
  final String id;
  final String name;
  final String description;
  final String? image;
  final DateTime createdAt; // ✅ NEW
  final DateTime updatedAt; // ✅ NEW
  final int version; // ✅ NEW

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'] ?? 0,
    );
  }
}
