part of 'get_all_courses_cubit.dart';

@immutable
sealed class GetAllCoursesState {}

final class GetAllCoursesInitial extends GetAllCoursesState {}

// Get all courses states
final class GetAllCoursesSuccess extends GetAllCoursesState {
  final GetAllCoursesModel allCourses;
  GetAllCoursesSuccess({required this.allCourses});
}

final class GetAllCoursesLoading extends GetAllCoursesState {}

final class GetAllCoursesFailure extends GetAllCoursesState {
  final String errMessage;

  GetAllCoursesFailure({required this.errMessage});
}
