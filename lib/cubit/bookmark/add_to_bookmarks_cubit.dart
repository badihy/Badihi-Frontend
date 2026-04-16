import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_to_bookmarks_state.dart';

class AddToBookmarksCubit extends Cubit<AddToBookmarksState> {
  AddToBookmarksCubit(this.api) : super(AddToBookmarksInitial());
  final ApiConsumer api;

  Future<void> addToBookmarks({required String userId, required String courseId}) async {
    try {
      emit(AddToBookmarksLoading());

      await api.post(
        EndPoints.addToBookmarks,
        data: {
          ApiKey.userId: userId,
          ApiKey.courseId: courseId,
        },
      );

      emit(AddToBookmarksSuccess());
    } on ServerException catch (e) {
      emit(AddToBookmarksFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(AddToBookmarksFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
