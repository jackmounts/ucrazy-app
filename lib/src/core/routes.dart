import 'package:flutter/material.dart';
import 'package:ucrazy_app/src/core/home/home_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
