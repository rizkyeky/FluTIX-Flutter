import 'package:flutix_training/model/model.dart';
import 'package:flutter/material.dart';
import 'view/page/page.dart';
// import 'Model/Model.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/detailmovie':
        final Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(builder: (_) => DetailMoviePage(movie));
      // case '/details':
      //   String walletName = settings.arguments;
      //   return MaterialPageRoute(builder: (_) => Details(walletName));
      //   break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}