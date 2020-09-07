import 'package:flutix_training/model/model.dart';
import 'package:flutter/material.dart';
import 'view/page/page.dart';
// import 'Model/Model.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/detailmovie':
        final Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(builder: (_) => DetailMoviePage(movie));
      case '/booktime':
        return MaterialPageRoute(builder: (_) => BookTimePage());
      case '/bookseat':
        return MaterialPageRoute(builder: (_) => BookSeatPage());
      case '/checkout':
        return MaterialPageRoute(builder: (_) => CheckoutPage());
      case '/checkoutsuccess':
        return MaterialPageRoute(builder: (_) => const SuccessCheckoutPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/preference':
        return MaterialPageRoute(builder: (_) => PreferencePage());
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