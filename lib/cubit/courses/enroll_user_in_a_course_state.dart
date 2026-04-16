part of 'enroll_user_in_a_course_cubit.dart';

@immutable
sealed class EnrollUserInACourseState {}

final class EnrollUserInACourseInitial extends EnrollUserInACourseState {}

// Enroll user in a course states
final class GetAllCoursesSuccess extends EnrollUserInACourseState {}

final class GetAllCoursesLoading extends EnrollUserInACourseState {}

final class GetAllCoursesFailure extends EnrollUserInACourseState {
  final String errMessage;

  GetAllCoursesFailure({required this.errMessage});
}
