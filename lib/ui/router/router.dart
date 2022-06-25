import 'package:flutter/material.dart';

import '../presenters/home/home.dart';


class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home :
        return _createRoute(const Home());

    }
  }

  static String initialRoute = home;
  static const String home = '/home';

  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation1, animation2, child) =>
            Align(child: SizeTransition(sizeFactor: animation1, child: child)),
        transitionDuration: const Duration(milliseconds: 400));
  }
}
