import 'package:block_porn/src/features/home/bloc/home_bloc.dart';

import '../../core/utils/injections.dart';
import '../../shared/services/permission_services.dart';

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton<IPermissionService>(() => PermissionService());

  sl.registerFactory<HomeBloc>(
    () => HomeBloc(permissionService: sl<IPermissionService>()),
  );
}
