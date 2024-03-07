import 'package:crypto_price_tracker/home_page.dart';
import 'package:crypto_price_tracker/second_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case '/second':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SecondPage(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
