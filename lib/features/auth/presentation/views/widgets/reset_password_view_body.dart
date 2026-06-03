import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

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
              'Reset Password',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            PasswordField(),
            SizedBox(height: 16),
            PasswordField(),
            SizedBox(height: 16),
            CustomButton(text: 'Submit', onPressed: () {}),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
