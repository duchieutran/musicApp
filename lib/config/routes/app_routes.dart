import 'package:flutter/material.dart';
import 'package:music/data/models/song.dart';
import 'package:music/screens/playing/playing.dart';
import 'package:music/screens/screens.dart';
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
      case screen:
        return const Screens();
      case play:
        return Playing(
          playingSong: arguments as Song,
          songs: arguments as List<Song>,
        );
      default:
        throw "$nameRoute is not define";
    }
  }

  static const String splash = '/';
  static const String screen = 'screen';
  static const String play = 'play';
}
