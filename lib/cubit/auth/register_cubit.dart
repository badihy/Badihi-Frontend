import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/cache/cache_helper_keys.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/presentation/models/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ApiConsumer api;
  RegisterCubit(this.api) : super(RegisterInitial());
  LoginModel? currentUser;

  void reset() {
    emit(RegisterInitial()); // Reset to default state
  }

  Future<void> register(
      {required String registerFullName,
      required String registerEmail,
      required String registerPassword}) async {
    try {
      emit(RegisterLoading());

      final response = await api.post(
        EndPoints.register,
        data: {
          ApiKey.fullName: registerFullName,
          ApiKey.email: registerEmail,
          ApiKey.password: registerPassword,
          ApiKey.passwordConfirm: registerPassword,
          ApiKey.phone: "0123456789"
        },
      );

      currentUser = LoginModel.fromJson(response);
      await getIt<CacheHelper>().saveUserSession(currentUser!);

      emit(RegisterSuccess());
    } on ServerException catch (e) {
      emit(RegisterFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(RegisterFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
