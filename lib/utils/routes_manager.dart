import 'package:eyepetizer_flutter/routes/splash_page.dart';
import 'package:eyepetizer_flutter/routes/tab_navigator.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const splash = "splash";
  static const bar = "/";
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());

      case RouteName.bar:
        return NoAnimRouteBuilder(TabNavigator());
      default:
        return null;
    }
  }
}

class NoAnimRouteBuilder extends PageRouteBuilder {
  final Widget page;

  NoAnimRouteBuilder(this.page)
      : super(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: 0),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}
