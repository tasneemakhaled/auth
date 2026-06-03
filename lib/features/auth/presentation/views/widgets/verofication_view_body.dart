import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/views/reset_password_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class VeroficationViewBody extends StatelessWidget {
  const VeroficationViewBody({super.key});

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
            Row(
              children: [
                Expanded(child: CustomTextField(hintText: '')),
                SizedBox(width: 5),
                Expanded(child: CustomTextField(hintText: '')),
                SizedBox(width: 5),
                Expanded(child: CustomTextField(hintText: '')),
                SizedBox(width: 5),
                Expanded(child: CustomTextField(hintText: '')),
                SizedBox(width: 5),
                Expanded(child: CustomTextField(hintText: '')),
              ],
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                Navigator.of(context).pushNamed(ResetPasswordView.routeName);
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
