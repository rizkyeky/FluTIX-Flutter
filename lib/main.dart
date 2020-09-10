import 'package:flutter/material.dart';
import 'locator.dart';
import 'model/model.dart';
import 'router.dart';
import 'service/service.dart';
import 'share/share.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();

  final bool isSignIn = locator.get<AuthService>(instanceName: 'Auth Service')
    .isSignIn;
  
  // Run App
  runApp(App(isSignIn: isSignIn));
}

class App extends StatelessWidget {

  final bool isSignIn;

  const App({this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FluTIX',
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: isSignIn ? '/' : '/signin',
      onGenerateRoute: Router.generateRoute,
    );
  }
}


