import 'dart:io';

import 'package:badihi/core/api/api_consumer.dart';
import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/errors/exceptions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'upload_profile_photo_state.dart';

class UploadProfilePhotoCubit extends Cubit<UploadProfilePhotoState> {
  UploadProfilePhotoCubit(this.api) : super(UploadProfilePhotoInitial());
  ApiConsumer api;

  // Upload profile photo data
  Future<void> uploadProfilePhoto(File image) async {
    try {
      emit(UploadProfilePhotoLoading());

      final response = await api.patch(
        EndPoints.updateUserProfile(getIt<CacheHelper>().getString(ApiKey.id)),
        data: {
          ApiKey.profileImage: await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          )
        },
        isFormData: true,
      );
      final String imagePath = response['data']['profileImage'];

      await getIt<CacheHelper>().setString(ApiKey.profileImage, imagePath);
      emit(UploadProfilePhotoSuccess());
    } on ServerException catch (e) {
      emit(UploadProfilePhotoFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(UploadProfilePhotoFailure(errMessage: "حدثت مشكلة ما، يرجى المحاولة مرة أخرى"));
    }
  }
}
