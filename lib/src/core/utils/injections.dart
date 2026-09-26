import 'package:block_porn/src/features/main/main_injections.dart';
import 'package:get_it/get_it.dart';
import '../../shared/services/shared_injections.dart';

final sl = GetIt.instance;

Future initInjections() async {
  await initSharedInjections();

  initMainInjections();

  sl.allReady();
}
