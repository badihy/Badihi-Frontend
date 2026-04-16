import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/presentation/models/get_all_bookmarks_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_bookmarks_state.dart';

class GetAllBookmarksCubit extends Cubit<GetAllBookmarksState> {
  GetAllBookmarksCubit(this.api) : super(GetAllBookmarksInitial());
  GetAllBookmarksModel? allUserBookmarks;

  final ApiConsumer api;
  bool hasData = false;

  Future<void> getAllBookmarks() async {
    if (state is GetAllBookmarksSuccess && hasData) {
      print("Here");
      return; // Data already loaded, no need to fetch again
    }
    try {
      emit(GetAllBookmarksLoading());

      final response = await api.get(EndPoints.getAllBookmarks(getIt<CacheHelper>().getString(ApiKey.id)));

      allUserBookmarks = GetAllBookmarksModel.fromJson(response);

      emit(GetAllBookmarksSuccess(allUserBookmarks: allUserBookmarks!));
      hasData = true;
    } on ServerException catch (e) {
      emit(GetAllBookmarksFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetAllBookmarksFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
