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
  locator.registerLazySingleton(() => UserService(), instanceName: 'User Service');
  locator.registerLazySingleton(() => MovieService(), instanceName: 'Movie Service');
  locator.registerLazySingleton(() => LocalService(), instanceName: 'Local Service');
  
  
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => MainTabBarBloc());
  locator.registerFactory(() => DetailMovieBloc());
  locator.registerFactory(() => BookTimeBloc());
  locator.registerFactory(() => BookSeatBloc());
  locator.registerFactory(() => CheckoutBloc());
  locator.registerFactory(() => SignInBloc());
  locator.registerFactory(() => SignUpBloc());
  locator.registerFactory(() => PreferenceBloc());

  locator.registerSingleton<Ticket>(Ticket.initial(), instanceName: 'Ticket');
  locator.registerSingleton<User>(User.initial(), instanceName: 'User Active');
}

Future<void> awaitSetupLocator() async {
  
  await locator.allReady();

  // Setup service
  await locator.get<CoreService>(instanceName: 'Core Service').init();
  await locator.get<AuthService>(instanceName: 'Auth Service').init();
  await locator.get<LocalService>(instanceName: 'Local Service').init();

  // Setup first bloc
  await locator.get<HomeBloc>().init();

  // print("setup locator success");
}