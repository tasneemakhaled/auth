import 'package:auth/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = 'forget password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ForgetPasswordViewBody());
  }
}
