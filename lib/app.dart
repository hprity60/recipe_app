import 'package:flutter/material.dart';

import 'core/routes/app_routers.dart';
import 'features/home/presentation/pages/home_page.dart';


class App extends StatelessWidget {
  App({required this.appRouter, super.key});

  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomePage.id,
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      
    );
  }
}
