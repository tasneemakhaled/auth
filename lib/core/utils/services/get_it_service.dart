import 'package:auth/core/utils/services/auth_service.dart';
import 'package:auth/features/auth/data/repos/auth_repo_impl.dart';
import 'package:auth/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authService: getIt.get<AuthService>()),
  );
}
