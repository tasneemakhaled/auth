import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/views/forget_password_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:auth/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              'SignIn',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),
            CustomTextField(hintText: 'Email/Phone Number'),
            SizedBox(height: 16),
            PasswordField(),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ForgetPasswordView.routeName);
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Forget Password?'),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(text: 'Log In', onPressed: () {}),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have account? '),
                Text(
                  'Sign Up',
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
