import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash = true;
  Loadscreen() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showingSplash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Loadscreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hot & Spicy News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showingSplash ?Splash_Screen(): Homescreen(),
    );
  }
}
