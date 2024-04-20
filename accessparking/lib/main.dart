import 'package:accessparking/widget/HomeUser.dart';
import 'package:accessparking/widget/Pconfi.dart';
import 'package:accessparking/widget/Register.dart';
import 'package:flutter/material.dart';
import 'widget/Session.dart';
import 'widget/SplashScreen.dart';
import 'widget/CreateVisitor.dart';
import 'package:get/get.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(name: '/splash', page: ()=> const SplashScreen()),
        GetPage(name: '/home', page: ()=> const Session()),
        GetPage(name: '/homeuser', page: ()=> const HomeUser()),
        GetPage(name: '/visitor', page: ()=> const Visitor(textv: '',)),
        GetPage(name: '/pconfi', page: ()=> const Pconfi(text: '')),
        GetPage(name: '/register', page: ()=> const Register(textv: '')),
        
      ]
    );
  }
}