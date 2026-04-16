class GetCourseDetailsByIdModel {
  final CourseDetails data;
  final int statusCode;
  final String timestamp;

  GetCourseDetailsByIdModel({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory GetCourseDetailsByIdModel.fromJson(Map<String, dynamic> json) {
    return GetCourseDetailsByIdModel(
      data: CourseDetails.fromJson(json['data']),
      statusCode: json['statusCode'],
      timestamp: json['timestamp'],
    );
  }
}

class CourseDetails {
  final String id;
  final String name;
  final String description;
  final String? shortDescription;
  final double price;
  final String estimationTime;
  final String coverImage;
  final String thumbnailImage;
  final List<String> willLearn;
  final List<String> requirements;
  final List<String> targetAudience;
  final String? level;
  final String createdAt;
  final String updatedAt;
  final int enrollmentsCount;
  final double averageRating;
  final bool isBookmarked; // Added this field
  final int reviewsCount; // Added this field
  final List<CourseReview> reviews; // Added this field
  final CourseCategory? category;
  final List<ChapterDetails> chapters;

  CourseDetails({
    required this.id,
    required this.name,
    required this.description,
    this.shortDescription,
    required this.price,
    required this.estimationTime,
    required this.coverImage,
    required this.thumbnailImage,
    required this.willLearn,
    required this.requirements,
    required this.targetAudience,
    this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.enrollmentsCount,
    required this.averageRating,
    required this.isBookmarked,
    required this.reviewsCount,
    required this.reviews,
    this.category,
    required this.chapters,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      price: (json['price'] as num).toDouble(),
      estimationTime: json['estimationTime'],
      coverImage: json['coverImage'] ?? '',
      thumbnailImage: json['thumbnailImage'] ?? '',
      willLearn: List<String>.from(json['willLearn'] ?? []),
      requirements: List<String>.from(json['requirements'] ?? []),
      targetAudience: List<String>.from(json['targetAudience'] ?? []),
      level: json['level'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      enrollmentsCount: json['enrollmentsCount'] ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      isBookmarked: json['isBookmarked'] ?? false,
      reviewsCount: json['reviewsCount'] ?? 0,
      reviews: (json['reviews'] as List?)?.map((e) => CourseReview.fromJson(e)).toList() ?? [],
      category: json['category'] != null ? CourseCategory.fromJson(json['category']) : null,
      chapters: (json['chapters'] as List?)?.map((e) => ChapterDetails.fromJson(e)).toList() ?? [],
    );
  }
}

// New CourseReview class for course details
class CourseReview {
  final String id;
  final int rating;
  final String comment;
  final String createdAt;
  final String updatedAt;
  final ReviewUser user;

  CourseReview({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory CourseReview.fromJson(Map<String, dynamic> json) {
    return CourseReview(
      id: json['_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: ReviewUser.fromJson(json['user']),
    );
  }
}

// ReviewUser class (reused from previous model)
class ReviewUser {
  final String id;
  final String fullName;
  final String username;
  final String email;

  ReviewUser({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['_id'],
      fullName: json['fullName'],
      username: json['username'],
      email: json['email'],
    );
  }
}

class CourseCategory {
  final String id;
  final String name;
  final String description;
  final String? image;

  CourseCategory({
    required this.id,
    required this.name,
    required this.description,
    this.image,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return CourseCategory(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class ChapterDetails {
  final String id;
  final String title;
  final String? subtitle; // Added subtitle field
  final String description;
  final int orderIndex;
  final bool isCompleted;
  final String createdAt;
  final String updatedAt;
  final List<LessonDetails>? lessons;

  ChapterDetails({
    required this.id,
    required this.title,
    this.subtitle,
    required this.description,
    required this.orderIndex,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    this.lessons,
  });

  factory ChapterDetails.fromJson(Map<String, dynamic> json) {
    return ChapterDetails(
      id: json['_id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      orderIndex: json['orderIndex'],
      isCompleted: json['isCompleted'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      lessons: json['lessons'] != null
          ? (json['lessons'] as List).map((e) => LessonDetails.fromJson(e)).toList()
          : null,
    );
  }
}

class LessonDetails {
  final String id;
  final String title;
  final String description;
  final int orderIndex;
  final int estimatedDuration;
  final bool isCompleted;
  final String createdAt;
  final String updatedAt;
  final List<String> slideIds; // Changed from List<SlideDetails> to List<String>

  LessonDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.estimatedDuration,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.slideIds,
  });

  factory LessonDetails.fromJson(Map<String, dynamic> json) {
    return LessonDetails(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      orderIndex: json['orderIndex'],
      estimatedDuration: json['estimatedDuration'],
      isCompleted: json['isCompleted'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slideIds: List<String>.from(json['slideIds'] ?? []),
    );
  }
}

// Note: SlideDetails class is kept but not directly used in LessonDetails anymore
// You might need it for separate slide fetching endpoints
class SlideDetails {
  final String id;
  final String title;
  final String type;
  final String textContent;
  final int orderIndex;
  final List<String> questions;
  final String? questionHint;
  final String? answer;
  final bool isCompleted;
  final String createdAt;
  final String updatedAt;

  SlideDetails({
    required this.id,
    required this.title,
    required this.type,
    required this.textContent,
    required this.orderIndex,
    required this.questions,
    this.questionHint,
    this.answer,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SlideDetails.fromJson(Map<String, dynamic> json) {
    return SlideDetails(
      id: json['_id'],
      title: json['title'],
      type: json['type'],
      textContent: json['textContent'],
      orderIndex: json['orderIndex'],
      questions: List<String>.from(json['questions'] ?? []),
      questionHint: json['questionHint'],
      answer: json['answer'],
      isCompleted: json['isCompleted'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
