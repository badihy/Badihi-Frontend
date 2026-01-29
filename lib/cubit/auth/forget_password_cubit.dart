import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ApiConsumer api;
  ForgetPasswordCubit(this.api) : super(ForgetPasswordInitial());
  void reset() {
    emit(ForgetPasswordInitial()); // Reset to default state
  }

  // Handling forgetPassword
  Future<void> forgetPassword({required String forgetPasswordEmail}) async {
    try {
      emit(ForgetPasswordLoading());

      final response = await api.post(
        EndPoints.forgetPassword,
        data: {
          ApiKey.email: forgetPasswordEmail,
        },
      );

      emit(ForgetPasswordSuccess());
    } on ServerException catch (e) {
      emit(ForgetPasswordFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(ForgetPasswordFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
