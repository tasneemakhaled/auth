import 'package:auth/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SignUpViewBody());
  }
}
