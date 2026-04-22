class GetAllCategories {
  final CategoriesData data;
  final int statusCode;
  final String timestamp;

  GetAllCategories({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory GetAllCategories.fromJson(Map<String, dynamic> json) {
    return GetAllCategories(
      data: CategoriesData.fromJson(json['data']),
      statusCode: json['statusCode'],
      timestamp: json['timestamp'],
    );
  }
}

class CategoriesData {
  final List<Category> data;
  final Meta meta;

  CategoriesData({
    required this.data,
    required this.meta,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    return CategoriesData(
      data: (json['data'] as List).map((e) => Category.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Category {
  final String id;
  final String name;
  final String description;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int version;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
    );
  }
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPrevPage;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
      totalPages: json['totalPages'],
      hasNextPage: json['hasNextPage'],
      hasPrevPage: json['hasPrevPage'],
    );
  }
}
