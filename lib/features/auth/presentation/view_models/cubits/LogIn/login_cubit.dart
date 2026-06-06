import 'package:auth/features/auth/domain/entites/user_entity.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var res = await authRepo.logInUser(email: email, password: password);
    res.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(
          LoginSuccess(
            userEntity: UserEntity(email: email, password: password),
          ),
        );
      },
    );
  }
}
