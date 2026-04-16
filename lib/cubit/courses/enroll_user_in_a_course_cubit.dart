import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'enroll_user_in_a_course_state.dart';

class EnrollUserInACourseCubit extends Cubit<EnrollUserInACourseState> {
  EnrollUserInACourseCubit(this.api) : super(EnrollUserInACourseInitial());

  final ApiConsumer api;

  Future<void> enrollUserInCourse({required String courseId}) async {
    try {
      emit(GetAllCoursesLoading());

      await api.post(EndPoints.enrollUserInCourse(courseId));

      emit(GetAllCoursesSuccess());
    } on ServerException catch (e) {
      emit(GetAllCoursesFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetAllCoursesFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
