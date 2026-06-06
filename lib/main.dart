import 'package:auth/core/utils/constants/api_keys.dart';
import 'package:auth/core/utils/helper_functions/on_generate_routes.dart';
import 'package:auth/core/utils/services/bloc_observer.dart';
import 'package:auth/core/utils/services/get_it_service.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:auth/features/auth/presentation/view_models/cubits/ForgetPassword/forget_password_cubit.dart';
import 'package:auth/features/auth/presentation/view_models/cubits/LogIn/login_cubit.dart';
import 'package:auth/features/auth/presentation/view_models/cubits/SignUp/sign_up_cubit.dart';
import 'package:auth/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: ApiKeys.appUrl, anonKey: ApiKeys.secretKey);
  Bloc.observer = CustomBlocObserver();
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit(getIt.get<AuthRepo>())),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SignUpView.routeName,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
