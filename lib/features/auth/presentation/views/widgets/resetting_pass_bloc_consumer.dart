import 'package:auth/features/auth/presentation/view_models/cubits/ForgetPassword/forget_password_cubit.dart';
import 'package:auth/features/auth/presentation/views/login_view.dart';
import 'package:auth/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResettingPassBlocConsumer extends StatelessWidget {
  const ResettingPassBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('your password was changed successfully')),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.routeName,
            (_) => false,
          );
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failure please try again')),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading,
          child: ResetPasswordView(),
        );
      },
    );
  }
}
