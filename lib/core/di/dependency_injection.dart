import 'package:get_it/get_it.dart';

import '../../features/log_in/controllers/Log_in_controller.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<LogInController>(() => LogInController());
}
