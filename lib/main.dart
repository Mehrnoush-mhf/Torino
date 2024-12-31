import 'package:flutter/material.dart';
import 'package:torino/authentication/ui/login.dart';
import 'package:torino/authentication/ui/register.dart';
import 'package:torino/home/ui/home.dart';
import 'package:torino/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'login' : (context) => LoginPage(),
        'register' : (context) => RegisterPage(),
        'splash' : (context) => const Splash(),
        '/' : (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
