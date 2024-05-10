import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/layout/layout_view.dart';

class SplashView extends StatefulWidget {

  static const String routeName="/";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

 @override
  void initState() {
    // TODO: implement initState
   Timer(const Duration(seconds: 2),
         () {
     Navigator.pushReplacementNamed(context,layoutView.routeName);
   },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   Size mediaQuery =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff121312),

      body: Center(
        child: Image.asset("assets/images/movies_splash_background.png",
        height: mediaQuery.height*.4,
          width: mediaQuery.width*.4,
         // fit: BoxFit.cover,
        ),
      ),

    );
  }
}
