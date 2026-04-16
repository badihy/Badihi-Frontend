import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/presentation/models/get_all_categories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.api) : super(GetAllCategoriesInitial());
  final ApiConsumer api;
  GetAllCategoriesModel? allCourses;
  bool hasData = false;

  Future<void> getAllCategories() async {
    if (state is GetAllCategoriesSuccess && hasData) {
      return; // Data already loaded, no need to fetch again
    }
    try {
      emit(GetAllCategoriesLoading());

      final response = await api.get(EndPoints.getAllCategories);
      allCourses = GetAllCategoriesModel.fromJson(response);

      emit(GetAllCategoriesSuccess(allCategories: allCourses!));
      hasData = true;
    } on ServerException catch (e) {
      emit(GetAllCategoriesFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetAllCategoriesFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
