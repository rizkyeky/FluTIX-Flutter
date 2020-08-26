import 'package:get_it/get_it.dart';
import 'service/service.dart';
import 'bloc/bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  // Waiting for first launch
  locator.registerSingleton(() => CoreService(), instanceName: 'Core Service');
  locator.registerSingleton(() => HomeBloc(), instanceName: 'Home Bloc');
  
  locator.registerLazySingleton(() => SignInBloc());
  locator.registerLazySingleton(() => SignUpBloc());

  // Not waiting for first launch

  print("setup locator");
}

Future<void> setupDB() async {

  await locator.get<CoreService>(instanceName: 'Core Service').init();
  await locator.get<HomeBloc>(instanceName: 'Home Bloc').init();
  
  print("setup DB");
}