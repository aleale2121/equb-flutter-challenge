import 'package:equb_flutter_challenge/screens/main-screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => MainScreen(),
      );
    }
    return MaterialPageRoute(
      builder: (context) => MainScreen(),
    );
  }
}
