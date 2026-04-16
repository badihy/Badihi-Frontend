part of 'update_user_cubit.dart';

@immutable
sealed class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}

// Update user states
final class UpdateUserSuccess extends UpdateUserState {
  final UpdateUserModel currentUser;

  UpdateUserSuccess({required this.currentUser});
}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserFailure extends UpdateUserState {
  final String errMessage;

  UpdateUserFailure({required this.errMessage});
}
