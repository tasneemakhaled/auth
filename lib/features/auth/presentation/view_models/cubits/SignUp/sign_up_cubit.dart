import 'package:auth/core/utils/services/failure.dart';
import 'package:auth/features/auth/domain/entites/user_entity.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());
    var res = await authRepo.signUpUser(email: email, password: password);
    res.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.errorMessage));
        return left(failure);
      },
      (success) {
        emit(SignUpSuccess());
        return right(null);
      },
    );
  }
}
