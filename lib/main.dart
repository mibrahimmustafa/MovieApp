import 'package:flutter/material.dart';
import 'package:movie_app/config/application_theme_manager.dart';
import 'package:movie_app/layout/layout_view.dart';
import 'package:movie_app/modules/search/page/search_view.dart';
import 'package:movie_app/modules/splash/page/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ApplicationThemeManager.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context) => const SplashView(),
        layoutView.routeName:(context) => layoutView(),
      },
    );
  }
}


