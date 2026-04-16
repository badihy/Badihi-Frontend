import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/presentation/models/update_user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.api) : super(UpdateUserInitial());
  final ApiConsumer api;
  UpdateUserModel? currentUser;

  // Handling update user data
  Future<void> updateUser({
    String fullName = "",
    String username = "",
  }) async {
    try {
      emit(UpdateUserLoading());

      final response = await api.patch(
        EndPoints.updateUser(getIt<CacheHelper>().getString(ApiKey.id)),
        data: {
          ApiKey.fullName: fullName == "" ? getIt<CacheHelper>().getString(ApiKey.fullName) : fullName,
          ApiKey.username: username == "" ? getIt<CacheHelper>().getString(ApiKey.username) : username,
        },
      );

      currentUser = UpdateUserModel.fromJson(response);

      emit(UpdateUserSuccess(currentUser: currentUser!));
    } on ServerException catch (e) {
      emit(UpdateUserFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(UpdateUserFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
