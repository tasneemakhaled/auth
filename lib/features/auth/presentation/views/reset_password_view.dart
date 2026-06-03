import 'package:auth/features/auth/presentation/views/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const routeName = 'reset password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResetPasswordViewBody(),
    );
  }
}
