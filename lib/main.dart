import 'package:flutter/material.dart';

import 'locator.dart';
// import 'service/service.dart';
import 'share/share.dart';
import 'view/page/page.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();

  // bool isSignIn = locator.get<AuthService>(instanceName: 'Auth Service').isSignIn;
  
  // Run App
  runApp(const App(isSignIn: true));
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
        primaryColor: mainColor,
        accentColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage()
    );
  }
}


