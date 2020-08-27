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
      case '/booktime':
        return MaterialPageRoute(builder: (_) => BookTimePage());
        break;
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