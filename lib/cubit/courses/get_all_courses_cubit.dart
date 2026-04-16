import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/presentation/models/get_all_courses_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_courses_state.dart';

class GetAllCoursesCubit extends Cubit<GetAllCoursesState> {
  GetAllCoursesCubit(this.api) : super(GetAllCoursesInitial());
  final ApiConsumer api;
  GetAllCoursesModel? allCourses;
  bool hasData = false;

  // Handling courses
  Future<void> getAllCourses() async {
    if (state is GetAllCoursesSuccess && hasData) {
      return; // Data already loaded, no need to fetch again
    }
    try {
      emit(GetAllCoursesLoading());

      final response = await api.get(EndPoints.getAllCourses);
      allCourses = GetAllCoursesModel.fromJson(response);

      emit(GetAllCoursesSuccess(allCourses: allCourses!));
      hasData = true;
    } on ServerException catch (e) {
      emit(GetAllCoursesFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetAllCoursesFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
