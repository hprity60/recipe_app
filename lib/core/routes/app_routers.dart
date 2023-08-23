import 'package:flutter/material.dart';
import 'package:recipe_app/core/arg_model/recipe_arg_model.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app/features/home/presentation/pages/recipe_details_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.id:
        //  final args = routeSettings.arguments as ArgModel;
        return MaterialPageRoute(builder: (_) => HomePage());

      case RecipeDetailPage.id:
        final args = routeSettings.arguments as RecipeArgModel;
        return MaterialPageRoute(
            builder: (_) => RecipeDetailPage(
                  recipes: args.recipes,
                ));

      default:
        return null;
    }
  }
}
