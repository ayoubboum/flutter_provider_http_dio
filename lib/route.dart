import 'package:fltr_provider/app.dart';
import 'package:fltr_provider/views/search.dart';
import 'package:flutter/material.dart';

const String initialRoute = "/";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
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
