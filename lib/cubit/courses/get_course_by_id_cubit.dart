import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/presentation/models/get_course_details_by_id_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_course_by_id_state.dart';

class GetCourseByIdCubit extends Cubit<GetCourseByIdState> {
  GetCourseByIdCubit(this.api) : super(GetCourseByIdInitial());
  final ApiConsumer api;
  GetCourseDetailsByIdModel? courseDetails;

  // Handling course details
  Future<void> getCourseDetails({required String courseId}) async {
    try {
      emit(GetCourseByIdLoading());

      final response = await api.get(EndPoints.getCourseDetails(courseId));
      courseDetails = GetCourseDetailsByIdModel.fromJson(response);

      emit(GetCourseByIdSuccess(courseDetails: courseDetails!));
    } on ServerException catch (e) {
      emit(GetCourseByIdFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetCourseByIdFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
