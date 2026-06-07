import 'package:auth/features/auth/presentation/view_models/cubits/ForgetPassword/forget_password_cubit.dart';
import 'package:auth/features/auth/presentation/views/reset_password_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/verofication_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationBlocConsumer extends StatelessWidget {
  const VerificationBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification is done successfuly')),
          );
          Navigator.of(context).pushNamed(ResetPasswordView.routeName);
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failure please try again')),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading,
          child: VeroficationViewBody(email: email),
        );
      },
    );
  }
}
