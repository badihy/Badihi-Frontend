part of 'delete_user_cubit.dart';

@immutable
sealed class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

// Delete user states
final class DeleteUserSuccess extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserFailure extends DeleteUserState {
  final String errMessage;

  DeleteUserFailure({required this.errMessage});
}
