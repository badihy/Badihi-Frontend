import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this.api) : super(DeleteUserInitial());
  final ApiConsumer api;

  // Handling update user data
  Future<void> deleteUser() async {
    try {
      emit(DeleteUserLoading());

      await api.delete(
        EndPoints.deleteUser(getIt<CacheHelper>().getString(ApiKey.id)),
      );

      emit(DeleteUserSuccess());
    } on ServerException catch (e) {
      emit(DeleteUserFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(DeleteUserFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
