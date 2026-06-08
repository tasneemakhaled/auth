// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("Auth App"),
    "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
    "creatAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "didntGetOtp": MessageLookupByLibrary.simpleMessage("Didn\'t get OTP?"),
    "doYouHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Do you have account?",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have account?",
    ),
    "emailPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Email/Phone Number",
    ),
    "enterOtp": MessageLookupByLibrary.simpleMessage("Enter OTP"),
    "enterOtpDescription": MessageLookupByLibrary.simpleMessage(
      "Enter the OTP code we just sent you on your registered Email/Phone number",
    ),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget Password"),
    "forgetPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Enter your registered email or phone number to reset your password",
    ),
    "forgetPasswordQuestion": MessageLookupByLibrary.simpleMessage(
      "Forget Password?",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "resendOtp": MessageLookupByLibrary.simpleMessage("Resend OTP"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signInLink": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpLink": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "submitting": MessageLookupByLibrary.simpleMessage("Submitting..."),
  };
}
