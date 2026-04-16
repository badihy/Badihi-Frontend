class GetAllCategoriesModel {
  final List<CategoryModel> data;
  final int statusCode;
  final String timestamp;

  GetAllCategoriesModel({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoriesModel(
      data: (json['data'] as List).map((e) => CategoryModel.fromJson(e)).toList(),
      statusCode: json['statusCode'],
      timestamp: json['timestamp'],
    );
  }
}

class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final int version;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'] ?? 0,
    );
  }
}
