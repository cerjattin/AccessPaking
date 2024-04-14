// ignore: file_names
import 'package:accessparking/widget/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 4);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Session()),
          (route) => false);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Splashscr.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    titleTextStyle: TextStyle(color: Colors.white),
                    title: Text(
                      "App Parqueadero",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      "Bienvenido a la app",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 218, 27, 243),
                      strokeWidth: 20,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
