import 'dart:io';

import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'report_problem_state.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  ReportProblemCubit(this.api) : super(ReportProblemInitial());

  final ApiConsumer api;

  Future<void> reportProblem({
    required String subject,
    required String message,
    File? image,
  }) async {
    try {
      emit(ReportProblemLoading());

      final Map<String, dynamic> data = {
        ApiKey.userId: getIt<CacheHelper>().getString(ApiKey.id),
        ApiKey.name: getIt<CacheHelper>().getString(ApiKey.fullName),
        ApiKey.email: getIt<CacheHelper>().getString(ApiKey.email),
        ApiKey.subject: subject,
        ApiKey.message: message,
        ApiKey.type: "problem",
      };

      if (image != null) {
        data[ApiKey.imageUrl] = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      }

      await api.post(
        EndPoints.reportProblem,
        data: data,
        isFormData: true,
      );

      emit(ReportProblemSuccess());
    } on ServerException catch (e) {
      emit(ReportProblemFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(ReportProblemFailure(errMessage: "حدثت مشكلة ما"));
    }
  }
}
