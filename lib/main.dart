import 'package:dosify_app/screen/HomePage.dart';
import 'package:dosify_app/screen/Login.dart';
import 'package:dosify_app/screen/Profile.dart';
import 'package:dosify_app/screen/Registrasi.dart';
import 'package:dosify_app/screen/splashscreen.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
