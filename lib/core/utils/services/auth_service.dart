import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  // sign up ,login, forget password
  // resetPasswordForEmail()  ,verifyOTP(), updateUser(password: newPassword)
  Future<void> signUp({required String email, required String password}) async {
    final AuthResponse res = await supabase.auth.signUp(
      password: password,
      email: email,
    );
  }

  Future<void> logIn({required String email, required String password}) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await supabase.auth.resetPasswordForEmail(email, redirectTo: null);
  }

  Future<void> verifyOTP({required String email, required String otp}) async {
    await supabase.auth.verifyOTP(
      type: OtpType.recovery,
      email: email,
      token: otp,
    );
  }

  Future<void> resetPassword({required String password}) async {
    await supabase.auth.updateUser(UserAttributes(password: password));
  }
}
