import 'package:auth/features/auth/presentation/views/forget_password_view.dart';
import 'package:auth/features/auth/presentation/views/login_view.dart';
import 'package:auth/features/auth/presentation/views/reset_password_view.dart';
import 'package:auth/features/auth/presentation/views/sign_up_view.dart';
import 'package:auth/features/auth/presentation/views/verification_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ForgetPasswordView());
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ResetPasswordView());
    case VerificationView.routeName:
      return MaterialPageRoute(builder: (context) => VerificationView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
