import 'package:flutter/material.dart';
import 'locator.dart';
import 'router.dart';
import 'service/service.dart';
import 'share/share.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();

  // final bool isSignIn = locator.get<AuthService>(instanceName: 'Auth Service')
  //   .isSignIn;
  
  // Run App
  runApp(App(isSignIn: false));
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
      // home: TestPage(),
      initialRoute: isSignIn ? '/' : '/signin',
      onGenerateRoute: Router.generateRoute,
    );
  }
}


