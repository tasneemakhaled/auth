import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo authRepo;
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgetPasswordLoading());
    var res = await authRepo.sendPasswordResetEmail(email: email);
    res.fold(
      (failure) {
        emit(ForgetPasswordFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(SendOtpSuccess(email));
      },
    );
  }

  Future<void> verifyOTP({required String email, required String otp}) async {
    emit(ForgetPasswordLoading());
    var res = await authRepo.verifyOTP(email: email, otp: otp);
    res.fold(
      (failure) {
        emit(ForgetPasswordFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(VerifyOtpSuccess());
      },
    );
  }

  Future<void> resetPassword({required String newPassword}) async {
    emit(ForgetPasswordLoading());
    var res = await authRepo.resetPassword(newPassword: newPassword);
    res.fold(
      (failure) {
        emit(ForgetPasswordFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
