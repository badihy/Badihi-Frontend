part of 'upload_profile_photo_cubit.dart';

@immutable
sealed class UploadProfilePhotoState {}

final class UploadProfilePhotoInitial extends UploadProfilePhotoState {}

// Upload profile photo states
final class UploadProfilePhotoSuccess extends UploadProfilePhotoState {}

final class UploadProfilePhotoLoading extends UploadProfilePhotoState {}

final class UploadProfilePhotoFailure extends UploadProfilePhotoState {
  final String errMessage;

  UploadProfilePhotoFailure({required this.errMessage});
}
