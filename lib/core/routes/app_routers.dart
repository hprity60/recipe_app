import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.id:
        //  final args = routeSettings.arguments as ArgModel;
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return null;
    }
  }
}
