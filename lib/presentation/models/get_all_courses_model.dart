class GetAllCoursesModel {
  final List<Course> data;
  final int statusCode;
  final String timestamp;

  GetAllCoursesModel({
    required this.data,
    required this.statusCode,
    required this.timestamp,
  });

  factory GetAllCoursesModel.fromJson(Map<String, dynamic> json) {
    return GetAllCoursesModel(
      data: (json['data'] as List).map((e) => Course.fromJson(e)).toList(),
      statusCode: json['statusCode'],
      timestamp: json['timestamp'],
    );
  }
}

class Course {
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final int enrollmentsCount;
  final double averageRating;
  final int reviewsCount;
  final bool isBookmarked;
  final Category? category;
  final List<Chapter> chapters;
  final List<Review> reviews; // Added reviews field

  Course({
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
    required this.reviewsCount,
    required this.isBookmarked,
    this.category,
    required this.chapters,
    required this.reviews, // Added this parameter
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
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
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      enrollmentsCount: json['enrollmentsCount'] ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviewsCount'] ?? 0,
      isBookmarked: json['isBookmarked'] ?? false,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      chapters: (json['chapters'] as List?)?.map((e) => Chapter.fromJson(e)).toList() ?? [],
      reviews: (json['reviews'] as List?)?.map((e) => Review.fromJson(e)).toList() ?? [],
    );
  }
}

class Category {
  final String id;
  final String name;
  final String description;
  final String? image;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}

// New Review class
class Review {
  final String id;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ReviewUser user;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: ReviewUser.fromJson(json['user']),
    );
  }
}

// New ReviewUser class (nested user object inside review)
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

class Chapter {
  final String id;
  final String title;
  final String? subtitle;
  final String description;
  final int orderIndex;
  final bool isCompleted;
  final List<Lesson>? lessons;
  final Quiz? quiz;
  final DateTime createdAt;
  final DateTime updatedAt;

  Chapter({
    required this.id,
    required this.title,
    this.subtitle,
    required this.description,
    required this.orderIndex,
    required this.isCompleted,
    this.lessons,
    this.quiz,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['_id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      orderIndex: json['orderIndex'],
      isCompleted: json['isCompleted'] ?? false,
      lessons:
          json['lessons'] != null ? (json['lessons'] as List).map((e) => Lesson.fromJson(e)).toList() : null,
      quiz: json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final int orderIndex;
  final int estimatedDuration;
  final bool isCompleted;
  final List<Slide> slides;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.estimatedDuration,
    required this.isCompleted,
    required this.slides,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      orderIndex: json['orderIndex'],
      estimatedDuration: json['estimatedDuration'],
      isCompleted: json['isCompleted'] ?? false,
      slides: (json['slides'] as List?)?.map((e) => Slide.fromJson(e)).toList() ?? [],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Slide {
  final String id;
  final String title;
  final String type;
  final String textContent;
  final int orderIndex;
  final List<String> questions;
  final String? questionHint;
  final String? answer;
  final bool isCompleted;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Slide({
    required this.id,
    required this.title,
    required this.type,
    required this.textContent,
    required this.orderIndex,
    required this.questions,
    this.questionHint,
    this.answer,
    required this.isCompleted,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['_id'],
      title: json['title'],
      type: json['type'],
      textContent: json['textContent'],
      orderIndex: json['orderIndex'],
      questions: List<String>.from(json['questions'] ?? []),
      questionHint: json['questionHint'],
      answer: json['answer'],
      isCompleted: json['isCompleted'] ?? false,
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Quiz {
  final String id;
  final String title;
  final String description;
  final List<QuizQuestion> questions;
  final int passingScore;
  final int timeLimit;
  final bool isCompleted;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.passingScore,
    required this.timeLimit,
    required this.isCompleted,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      questions: (json['questions'] as List?)?.map((e) => QuizQuestion.fromJson(e)).toList() ?? [],
      passingScore: json['passingScore'],
      timeLimit: json['timeLimit'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;
  final int orderIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    required this.orderIndex,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      explanation: json['explanation'],
      orderIndex: json['orderIndex'],
    );
  }
}
