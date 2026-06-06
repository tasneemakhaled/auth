import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  // ─────────────────────────────────────────
  // SIGN UP
  // ─────────────────────────────────────────
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      // Supabase may return a user but with no session
      // if email confirmation is required
      if (res.user != null && res.session == null) {
        return 'Check your email to confirm your account.';
      }

      return null; // null = success, no error
    } on AuthException catch (e) {
      switch (e.code) {
        case 'user_already_exists':
        case 'email_exists':
          return 'This email is already registered.';

        case 'weak_password':
          return 'Password is too weak. Use at least 8 characters.';

        case 'email_address_invalid':
          return 'Please enter a valid email address.';

        case 'email_address_not_authorized':
          return 'This email domain is not allowed.';

        case 'signup_disabled':
          return 'Sign ups are currently disabled. Try again later.';

        case 'over_email_send_rate_limit':
          return 'Too many attempts. Please wait a moment and try again.';

        case 'over_request_rate_limit':
          return 'Too many requests. Please slow down and try again.';

        case 'email_provider_disabled':
          return 'Email sign up is not enabled.';

        case 'validation_failed':
          return 'Invalid input. Please check your details.';

        case 'unexpected_failure':
          return 'Something went wrong on our end. Please try again.';

        default:
          return e.message; // fallback to raw message
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }

  // ─────────────────────────────────────────
  // SIGN IN
  // ─────────────────────────────────────────
  Future<String?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);

      return null; // null = success
    } on AuthException catch (e) {
      switch (e.code) {
        case 'invalid_credentials':
          return 'Wrong email or password.';

        case 'email_not_confirmed':
          return 'Please confirm your email before signing in.';

        case 'user_not_found':
          return 'No account found with this email.';

        case 'user_banned':
          return 'Your account has been suspended.';

        case 'over_request_rate_limit':
          return 'Too many login attempts. Please wait and try again.';

        case 'over_email_send_rate_limit':
          return 'Too many requests for this email. Wait a moment.';

        case 'session_expired':
          return 'Your session expired. Please sign in again.';

        case 'email_provider_disabled':
          return 'Email sign in is not enabled.';

        case 'captcha_failed':
          return 'CAPTCHA verification failed. Try again.';

        case 'request_timeout':
          return 'Request timed out. Check your internet connection.';

        case 'unexpected_failure':
          return 'Something went wrong. Please try again.';

        default:
          return e.message;
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }

  // ─────────────────────────────────────────
  // SCREEN 1 — Send OTP to Email
  // ─────────────────────────────────────────
  Future<String?> sendPasswordResetEmail(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email, redirectTo: null);

      return null; // null = success, email sent
    } on AuthException catch (e) {
      switch (e.code) {
        case 'user_not_found':
          // ⚠️ Security tip: don't reveal if email exists or not
          // Just show success message either way
          return null;

        case 'over_email_send_rate_limit':
          return 'Too many reset requests. Please wait a few minutes.';

        case 'over_request_rate_limit':
          return 'Too many requests. Please slow down.';

        case 'email_address_not_authorized':
          return 'This email is not authorized.';

        case 'request_timeout':
          return 'Request timed out. Check your internet and retry.';

        case 'unexpected_failure':
          return 'Something went wrong. Please try again.';

        default:
          return e.message;
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }

  // ─────────────────────────────────────────
  // SCREEN 2 — Verify OTP Code
  // ─────────────────────────────────────────
  Future<String?> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final res = await supabase.auth.verifyOTP(
        type: OtpType.recovery,
        email: email,
        token: otp,
      );

      if (res.session == null) {
        return 'Verification failed. Please try again.';
      }

      return null; // null = success, go to Screen 3
    } on AuthException catch (e) {
      switch (e.code) {
        case 'otp_expired':
          return 'This code has expired. Please request a new one.';

        case 'bad_jwt':
        case 'invalid_credentials':
          return 'Incorrect code. Please check and try again.';

        case 'over_request_rate_limit':
          return 'Too many attempts. Please wait and try again.';

        case 'flow_state_expired':
        case 'flow_state_not_found':
          return 'Session expired. Please restart the reset process.';

        case 'otp_disabled':
          return 'OTP sign in is disabled.';

        case 'unexpected_failure':
          return 'Something went wrong. Please try again.';

        default:
          return e.message;
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }

  // ─────────────────────────────────────────
  // SCREEN 3 — Set New Password
  // ─────────────────────────────────────────
  Future<String?> resetPassword({required String password}) async {
    try {
      await supabase.auth.updateUser(UserAttributes(password: password));

      return null; // null = success
    } on AuthException catch (e) {
      switch (e.code) {
        case 'same_password':
          return 'New password must be different from your old one.';

        case 'weak_password':
          return 'Password is too weak. Use at least 8 characters.';

        case 'session_not_found':
        case 'session_expired':
          return 'Session expired. Please restart the reset process.';

        case 'reauthentication_needed':
          return 'Please verify your identity again.';

        case 'user_not_found':
          return 'User not found. Please sign in again.';

        case 'unexpected_failure':
          return 'Something went wrong. Please try again.';

        default:
          return e.message;
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }
}

// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final supabase = Supabase.instance.client;
//   // sign up ,login, forget password
//   // resetPasswordForEmail()  ,verifyOTP(), updateUser(password: newPassword)
//   Future<void> signUp({required String email, required String password}) async {
//     try {
//       final AuthResponse res = await supabase.auth.signUp(
//         password: password,
//         email: email,
//       );
//     } on Exception catch (e) {
//       // TODO
//     }
//   }

//   Future<void> logIn({required String email, required String password}) async {
//     try {
//       final AuthResponse res = await supabase.auth.signInWithPassword(
//         password: password,
//         email: email,
//       );
//     } on Exception catch (e) {
//       // TODO
//     }
//   }

//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await supabase.auth.resetPasswordForEmail(email, redirectTo: null);
//     } on Exception catch (e) {
//       // TODO
//     }
//   }

//   Future<void> verifyOTP({required String email, required String otp}) async {
//     try {
//       await supabase.auth.verifyOTP(
//         type: OtpType.recovery,
//         email: email,
//         token: otp,
//       );
//     } on Exception catch (e) {
//       // TODO
//     }
//   }

//   Future<void> resetPassword({required String password}) async {
//     try {
//       await supabase.auth.updateUser(UserAttributes(password: password));
//     } on Exception catch (e) {
//       // TODO
//     }
//   }
// }
