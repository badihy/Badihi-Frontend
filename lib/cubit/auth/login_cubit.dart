import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/presentation/models/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiConsumer api;
  LoginCubit(this.api) : super(LoginInitial());
  LoginModel? currentUser;

  // Handling signIn
  Future<void> login({required String loginEmail, required String loginPassword}) async {
    try {
      emit(LoginLoading());

      final response = await api.post(
        EndPoints.login,
        data: {
          ApiKey.email: loginEmail,
          ApiKey.password: loginPassword,
        },
      );

      currentUser = LoginModel.fromJson(response);

      await getIt<CacheHelper>().setString(ApiKey.token, currentUser!.data.token);
      await getIt<CacheHelper>().setString(ApiKey.id, currentUser!.data.user.id);
      await getIt<CacheHelper>().setString(ApiKey.fullName, currentUser!.data.user.fullName);
      await getIt<CacheHelper>().setString(ApiKey.username, currentUser!.data.user.username);
      await getIt<CacheHelper>().setString(ApiKey.email, currentUser!.data.user.email);

      print("Here 1: ${currentUser!.data.token}");
      print("Here 2: ${currentUser!.data.refreshToken}");

      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(LoginFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }

  // Handling signIn
  Future<void> googleAuth({required String uid}) async {
    try {
      emit(LoginLoading());

      final response = await api.post(
        EndPoints.googleAuth,
        data: {
          ApiKey.uid: uid,
        },
      );

      // currentUser = LoginModel.fromJson(response);

      await getIt<CacheHelper>().setString(ApiKey.token, currentUser!.data.token);
      await getIt<CacheHelper>().setString(ApiKey.refreshToken, currentUser!.data.refreshToken);
      await getIt<CacheHelper>().setString(ApiKey.id, currentUser!.data.user.id);
      await getIt<CacheHelper>().setString(ApiKey.fullName, currentUser!.data.user.fullName);
      await getIt<CacheHelper>().setString(ApiKey.username, currentUser!.data.user.username);
      await getIt<CacheHelper>().setString(ApiKey.email, currentUser!.data.user.email);

      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(LoginFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
