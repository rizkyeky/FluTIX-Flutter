import 'package:flutix_training/service/service.dart';
import 'package:flutter/material.dart';

import 'view/page/page.dart';

CoreService coreService = CoreService();
AuthService authService = AuthService();

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  // Await services init
  await coreService.init();
  final bool isSignIn = await authService.isSignIn();
  
  // Run App
  runApp(App(isSignIn: isSignIn));
}

class App extends StatelessWidget {

  final bool isSignIn;

  const App({this.isSignIn});

  @override
  Widget build(BuildContext context) {

    final Widget home = isSignIn ? const HomePage(title: 'Home Page',) : const SignInPage();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home Page'),
            RaisedButton(
              onPressed: () async => authService.signOut(),
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}

