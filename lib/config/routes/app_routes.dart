import 'package:flutter/material.dart';
import 'package:music/screens/home/home.dart';
import 'package:music/screens/splash/splash.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (context) => makeRoute(
            nameRoute: settings.name!,
            context: context,
            arguments: settings.arguments),
      );

  static makeRoute(
      {required String nameRoute,
      required BuildContext context,
      Object? arguments}) {
    switch (nameRoute) {
      case splash:
        return const Splash();
      case home:
        return const Home();
      default:
        throw "$nameRoute is not define";
    }
  }

  static const String splash = '/';
  static const String home = 'home';
}
