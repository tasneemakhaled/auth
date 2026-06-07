import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/view_models/cubits/ForgetPassword/forget_password_cubit.dart';
import 'package:auth/features/auth/presentation/views/reset_password_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class VeroficationViewBody extends StatefulWidget {
  const VeroficationViewBody({super.key, required this.email});
  final String email;
  @override
  State<VeroficationViewBody> createState() => _VeroficationViewBodyState();
}

TextEditingController otpEditingController = TextEditingController();

class _VeroficationViewBodyState extends State<VeroficationViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Enter OTP',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),
            Pinput(length: 6, controller: otpEditingController),
            SizedBox(height: 16),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                context.read<ForgetPasswordCubit>().verifyOTP(
                  email: widget.email,
                  otp: otpEditingController.text,
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn’t get OTP? '),
                Text(
                  'Resend OTP',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
