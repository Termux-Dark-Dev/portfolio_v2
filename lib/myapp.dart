import 'package:flutter/material.dart';
import 'package:portfoliov2/utils/router/route_config.dart';
import 'package:portfoliov2/utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Vishal Pandey",
      theme: ThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
