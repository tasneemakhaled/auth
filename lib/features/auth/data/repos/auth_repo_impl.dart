import 'package:auth/core/utils/services/auth_service.dart';
import 'package:auth/core/utils/services/failure.dart';
import 'package:auth/features/auth/domain/entites/user_entity.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;

  AuthRepoImpl({required this.authService});
  @override
  Future<Either<Failure, UserEntity>> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      var res = await authService.signUp(email: email, password: password);
      return right(UserEntity(email: email, password: password));
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      var res = await authService.logIn(email: email, password: password);
      return right(UserEntity(email: email, password: password));
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      var res = await authService.sendPasswordResetEmail(email);
      return right(null);
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      var res = await authService.verifyOTP(email: email, otp: otp);
      return right(null);
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await authService.resetPassword(password: newPassword);
      return right(null);
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
