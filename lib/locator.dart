import 'package:flutix_training/main.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  // Waiting for first launch
  locator.registerLazySingleton(() => CoreService(), instanceName: 'Core Service');
  locator.registerLazySingleton(() => AuthService(), instanceName: 'Auth Service');
  
  locator.registerLazySingleton(() => MainTabBarBloc(), instanceName: 'MainTabBar Bloc');
  locator.registerLazySingleton(() => HomeBloc(), instanceName: 'Home Bloc');
  locator.registerLazySingleton(() => DetailMovieBloc());
  locator.registerLazySingleton(() => BookTimeBloc());
  locator.registerLazySingleton(() => BookSeatBloc());
  locator.registerLazySingleton(() => CheckoutBloc());

  locator.registerSingleton(() => Movie.initial(), instanceName: 'Booked Movie');
  
  locator.registerLazySingleton(() => SignInBloc());
  locator.registerLazySingleton(() => SignUpBloc());

}

Future<void> awaitSetupLocator() async {
  
  await locator.allReady();

  // Setup service
  // await locator.get<CoreService>(instanceName: 'Core Service').init();
  // await locator.get<AuthService>(instanceName: 'Auth Service').init();

  // Setup first bloc
  await locator.get<HomeBloc>(instanceName: 'Home Bloc').init();

  // print("setup locator success");
}