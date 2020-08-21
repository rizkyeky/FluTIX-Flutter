import 'package:flutix_training/service/service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  // Await services init
  await CoreService.init();
  bool isSignIn = await AuthService.isSignIn();
  
  // Run App
  runApp(MyApp(isSignIn));
}

class MyApp extends StatelessWidget {

  final bool isSignIn;

  MyApp(this.isSignIn);

  @override
  Widget build(BuildContext context) {

    Widget home = (isSignIn) ? MyHomePage(title: 'Home Page',) : MyHomePage(title: 'SignIn Page',);

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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<bool>(
              stream: AuthService.isSignInStream(),
              builder: (context, snapshot) {
                return Text(
                  (snapshot.hasData) 
                  ? (snapshot.data) 
                    ? 'You Already Sign In' 
                    : 'You Sign Out'
                  : 'Loading',
                );
              }
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () async {
                AuthResult result = await AuthService.signIn(
                  'rizeky@gmail.com',
                  '123456',
                );

                if (result.user == null) {
                  print(result.message);
                } else {
                  print(result.user.toString());
                }
              }
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () async => AuthService.signOut(),
            )
          ],
        ),
      ),
    );
  }
}

