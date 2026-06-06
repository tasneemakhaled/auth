import 'package:auth/core/utils/services/failure.dart';
import 'package:auth/features/auth/domain/entites/user_entity.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> logInUser({
    required String email,
    required String password,
  }) {
    // TODO: implement logInUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signUpUser({
    required String email,
    required String password,
  }) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOTP({
    required String email,
    required String otp,
  }) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
