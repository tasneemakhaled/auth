import 'package:auth/features/auth/presentation/view_models/cubits/LogIn/login_cubit.dart';
import 'package:auth/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}
