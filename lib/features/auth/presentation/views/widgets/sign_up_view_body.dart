import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/views/login_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:auth/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
              'SignUp',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(hintText: 'Name'),
            SizedBox(height: 16),
            CustomTextField(hintText: 'Email/Phone Number'),
            SizedBox(height: 16),
            PasswordField(),
            SizedBox(height: 16),
            CustomButton(text: 'Creat Account', onPressed: () {}),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do you have account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginView.routeName);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
