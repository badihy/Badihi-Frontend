import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'refresh_token_state.dart';

class RefreshTokenCubit extends Cubit<RefreshTokenState> {
  RefreshTokenCubit(this.apii) : super(RefreshTokenInitial());
  final ApiConsumer apii;
  // Dio api = Dio();

  // Handling refreshToken
  Future<void> refreshToken() async {
    try {
      emit(RefreshTokenLoading());
      final refreshToken = await getIt<CacheHelper>().getString(ApiKey.refreshToken);

      final response = await apii.get(
        EndPoints.refreshToken,
      );

      emit(RefreshTokenSuccess());
    } on ServerException catch (e) {
      emit(RefreshTokenFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(RefreshTokenFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
