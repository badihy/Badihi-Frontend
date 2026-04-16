import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_bookmark_state.dart';

class DeleteBookmarkCubit extends Cubit<DeleteBookmarkState> {
  DeleteBookmarkCubit(this.api) : super(DeleteBookmarkInitial());

  final ApiConsumer api;

  Future<void> deleteBookmark({required String courseId}) async {
    try {
      emit(DeleteBookmarkLoading());

      await api.delete(EndPoints.deleteBookmark(getIt<CacheHelper>().getString(ApiKey.id), courseId));

      emit(DeleteBookmarkSuccess());
    } on ServerException catch (e) {
      emit(DeleteBookmarkFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(DeleteBookmarkFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
