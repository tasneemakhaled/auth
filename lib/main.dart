import 'package:auth/core/utils/constants/api_keys.dart';
import 'package:auth/core/utils/helper_functions/on_generate_routes.dart';
import 'package:auth/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: ApiKeys.appUrl, anonKey: ApiKeys.secretKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignUpView.routeName,
      onGenerateRoute: onGenerateRoutes,
      home: Scaffold(),
    );
  }
}
