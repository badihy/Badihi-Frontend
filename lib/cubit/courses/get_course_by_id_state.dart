part of 'get_course_by_id_cubit.dart';

@immutable
sealed class GetCourseByIdState {}

final class GetCourseByIdInitial extends GetCourseByIdState {}

// Get all courses states
final class GetCourseByIdSuccess extends GetCourseByIdState {
  final GetCourseDetailsByIdModel courseDetails;
  GetCourseByIdSuccess({required this.courseDetails});
}

final class GetCourseByIdLoading extends GetCourseByIdState {}

final class GetCourseByIdFailure extends GetCourseByIdState {
  final String errMessage;

  GetCourseByIdFailure({required this.errMessage});
}
