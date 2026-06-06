import 'package:auth/core/utils/services/failure.dart';
import 'package:auth/features/auth/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> logInUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
  Future<Either<Failure, void>> verifyOTP({
    required String email,
    required String otp,
  });
  Future<Either<Failure, void>> resetPassword({required String newPassword});
}
