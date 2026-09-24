import 'package:get_it/get_it.dart';
import '../../shared/services/permission_services.dart';
import 'bloc/home_bloc.dart';

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
