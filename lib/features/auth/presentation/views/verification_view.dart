import 'package:auth/features/auth/presentation/views/widgets/verofication_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static const routeName = 'verification view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: VeroficationViewBody());
  }
}
