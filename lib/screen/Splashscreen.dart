import 'dart:async';

import 'package:dosify_app/screen/Login.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}): super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4D39),
      body: Center(
        child: Container(
          width: 300,
          height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DOsify.',
                  style: TextStyle(
                    color: Color(0xFFECE3CE),
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Organize your tasks easily and efficiently.\n'
                  'Increase your productivity with a simple\n'
                  'and intuitive to do list app.',
                  style: TextStyle(
                    color: Color(0xFFECE3CE),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}