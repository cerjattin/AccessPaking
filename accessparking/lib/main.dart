import 'package:flutter/material.dart';
import 'widget/Session.dart';
import 'widget/SplashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => const Session(),
        "splash": (BuildContext context) => const SplashScreen(),
      },
    );
  }
}
