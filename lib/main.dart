import 'package:flutix_training/service/service.dart';
import 'package:flutter/material.dart';

import 'view/page/page.dart';

CoreService coreService = CoreService();
AuthService authService = AuthService();

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  // Await services init
  // await coreService.init();
  // final bool isSignIn = await authService.isSignIn();
  
  // Run App
  runApp(App(isSignIn: true));
}

class App extends StatelessWidget {

  final bool isSignIn;

  const App({this.isSignIn});

  @override
  Widget build(BuildContext context) {

    // final Widget home = isSignIn ? const HomePage(title: 'Home Page',) : FavoritePage();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage()
    );
  }
}


