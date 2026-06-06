part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

class SendOtpSuccess extends ForgetPasswordState {
  final String email; // pass to OTP screen
  SendOtpSuccess(this.email);
}

class VerifyOtpSuccess extends ForgetPasswordState {}

class ResetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  // ← was missing
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}
