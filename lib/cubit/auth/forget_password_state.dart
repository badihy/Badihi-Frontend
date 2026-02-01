part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

// Forget password states
final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailure({required this.errMessage});
}

// Reset password states
final class ResetPasswordSuccess extends ForgetPasswordState {}

final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordFailure extends ForgetPasswordState {
  final String errMessage;

  ResetPasswordFailure({required this.errMessage});
}
