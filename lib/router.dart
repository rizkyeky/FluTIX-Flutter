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
        final Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(builder: (_) => BookTimePage(movie));
        break;
      case '/bookseat':
        final Movie movie = (settings.arguments as Map)['movie'] as Movie;
        final Map<String, String> selectedBook = (settings.arguments as Map)['book'] as Map<String, String>;
        return MaterialPageRoute(builder: (_) => BookSeatPage(movie, selectedBook));
      case '/checkout':
        final Movie movie = (settings.arguments as Map)['movie'] as Movie;
        final Map<String, String> selectedBook = (settings.arguments as Map)['book'] as Map<String, String>;
        return MaterialPageRoute(builder: (_) => CheckoutPage(movie, selectedBook));
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