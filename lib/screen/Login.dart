import 'package:flutter/material.dart';
import 'package:dosify_app/widget/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4D39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  child: Text(
                    'DOsify.',
                    style: TextStyle(
                      color: Color(0xFFECE3CE),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Warna border
                      width: 2, // Lebar border
                    ),
                    borderRadius: BorderRadius.circular(10), // Sudut border (opsional)
                  ),
                  child:Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          'Sign in to continue!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
      )
    );
  }
}