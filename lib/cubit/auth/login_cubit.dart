import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
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

      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(LoginFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
