import 'package:alquranbd/readable.dart';
import 'package:alquranbd/screens/ayat.dart';
import 'package:alquranbd/screens/homepage.dart';
import 'package:alquranbd/screens/surah.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/page_not_available.dart';

class RoutesName {
  static const String home = '/';
  // ignore: non_constant_identifier_names
  static const String quran = '/quran';
  // ignore: non_constant_identifier_names
  static const String ayat = '/ayat';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routingData = settings.name!.getRoutingData;
    // switch (routingData.route) {
    //   case RoutesName.home:
    //     return _GeneratePageRoute(
    //         widget: const HomePage(), routeName: settings.name!);
    //   case RoutesName.surah:
    //     return _GeneratePageRoute(
    //         widget: Surah(
    //           surah: routingData._queryParameters['surah'],
    //         ),
    //         routeName: settings.name!);
    //   case RoutesName.ayat:
    //     return _GeneratePageRoute(
    //         widget: Surah(surah: routingData._queryParameters['surah']),
    //         routeName: settings.name!);
    //   default:
    //     return _GeneratePageRoute(
    //         widget: const ThisPageIsNotAvailable(), routeName: settings.name!);
    // }
    if (routingData.route == RoutesName.home) {
      return _GeneratePageRoute(
          widget: const HomePage(), routeName: settings.name!);
    } else if (routingData.route == RoutesName.quran &&
        routingData._queryParameters['surah'] != null &&
        routingData._queryParameters['ayat'] == null &&
        int.parse(routingData._queryParameters['surah']!) >= 1 &&
        int.parse(routingData._queryParameters['surah']!) <= 114) {
      return _GeneratePageRoute(
          widget: Surah(
            surahNumber: int.parse(
              routingData._queryParameters['surah']!,
            ),
          ),
          routeName: settings.name!);
    } else if (routingData.route == RoutesName.quran &&
        routingData._queryParameters['surah'] != null &&
        routingData._queryParameters['ayat'] != null &&
        int.parse(routingData._queryParameters['ayat']!) <=
            Readable.QuranData[
                    int.parse(routingData._queryParameters['surah']!) - 1]
                ['total_verses']!) {
      return _GeneratePageRoute(
          widget: Ayat(
            surahNumber: int.parse(
              routingData._queryParameters['surah']!,
            ),
            ayatNumber: int.parse(
              routingData._queryParameters['ayat']!,
            ),
          ),
          routeName: settings.name!);
    } else {
      return _GeneratePageRoute(
          widget: const ThisPageIsNotAvailable(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                // textDirection: TextDirection.rtl,
                // position: Tween<Offset>(
                //   begin: Offset(1.0, 0.0),
                //   end: Offset.zero,
                // ).animate(animation),
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(animation),
                child: child,
              );
            });
}

class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    required this.route,
    required Map<String, String> queryParameters,
  }) : _queryParameters = queryParameters;

  operator [](String key) => _queryParameters[key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    if (kDebugMode) {
      print(
          'queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    }
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
