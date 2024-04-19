import 'package:flutter/material.dart';
import 'package:movie_app/core/config/application_theme_manager.dart';
import 'package:movie_app/layout/layout_view.dart';
import 'package:movie_app/modules/splash/page/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//FirebaseDatabase database = FirebaseDatabase.instance;
// FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
// FirebaseDatabase databaseused = FirebaseDatabase.instanceFor(app: secondaryApp);

final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://movieapp-6a444-default-rtdb.firebaseio.com/');
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


