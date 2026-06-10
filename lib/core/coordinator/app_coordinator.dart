import 'package:get_it/get_it.dart';
import 'package:training_acedamy/core/theme/theme_cubit.dart';
import 'package:training_acedamy/features/authentication/presentation/controllers/authentication_cubit.dart';
import 'package:training_acedamy/features/client_account/data/repository/client_account_repository.dart';
import 'package:training_acedamy/features/client_account/presentation/controllers/client_account_cubit.dart';
import 'package:training_acedamy/features/employee_layout/data/repository/employee_account_repository.dart';
import 'package:training_acedamy/features/employee_layout/presentation/controllers/employee_account_cubit.dart';

final GetIt getIt = GetIt.instance;

abstract class AppCoordinator {
  static Future<void> init() async {
    if (!getIt.isRegistered<ThemeCubit>()) {
      final themeCubit = ThemeCubit();
      await themeCubit.loadTheme();
      getIt.registerSingleton<ThemeCubit>(themeCubit);
    }

    if (!getIt.isRegistered<AuthenticationCubit>()) {
      getIt.registerSingleton<AuthenticationCubit>(AuthenticationCubit());
    }

    if (!getIt.isRegistered<ClientAccountRepository>()) {
      getIt.registerLazySingleton<ClientAccountRepository>(
        () => ClientAccountRepository(),
      );
    }

    if (!getIt.isRegistered<EmployeeAccountRepository>()) {
      getIt.registerLazySingleton<EmployeeAccountRepository>(
        () => EmployeeAccountRepository(),
      );
    }

    if (!getIt.isRegistered<ClientAccountCubit>()) {
      getIt.registerFactory<ClientAccountCubit>(
        () => ClientAccountCubit(repository: getIt<ClientAccountRepository>()),
      );
    }

    if (!getIt.isRegistered<EmployeeAccountCubit>()) {
      getIt.registerFactory<EmployeeAccountCubit>(
        () => EmployeeAccountCubit(
          repository: getIt<EmployeeAccountRepository>(),
        ),
      );
    }
  }
}
