import 'package:auth/features/auth/presentation/views/widgets/login_bloc_consumer.dart';
import 'package:auth/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: LoginBlocConsumer());
  }
}
