import 'package:block_porn/src/features/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../shared/services/permission_services.dart';

final sl = GetIt.instance;

Future<void> initHomeInjections() {
  if (!sl.isRegistered<IPermissionService>()) {
    sl.registerLazySingleton<IPermissionService>(() => PermissionService());
  }
  if (!sl.isRegistered<HomeBloc>()) {
    sl.registerFactory<HomeBloc>(
      () => HomeBloc(permissionService: sl<IPermissionService>()),
    );
  }
  return Future.value();
}
