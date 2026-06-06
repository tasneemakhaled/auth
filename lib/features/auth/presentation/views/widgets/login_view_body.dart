import 'package:auth/core/utils/constants/app_colors.dart';
import 'package:auth/features/auth/presentation/view_models/cubits/LogIn/login_cubit.dart';
import 'package:auth/features/auth/presentation/views/forget_password_view.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:auth/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
late String email, password;

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
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
              CustomTextField(
                hintText: 'Email/Phone Number',
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
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
              CustomButton(
                text: 'Log In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().loginUser(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
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
      ),
    );
  }
}
