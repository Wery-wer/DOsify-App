import 'package:dosify_app/utils/constants/colors.dart';
import 'package:dosify_app/utils/constants/text_string.dart';
import 'package:dosify_app/widget/PasswordForm.dart';
import 'package:dosify_app/widget/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:dosify_app/widget/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3A4D39),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Container(
                    alignment: Alignment.center,
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: GColors.textWhite),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Text("Sign In to continue!",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: GColors.textWhite)),
                ),
                SizedBox(height: 10),
                LoginForm(hintText: GTexts.email, controller: emailController),
                SizedBox(height: 20),
                PasswordForm(
                    hintText: GTexts.password, controller: passwordController),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: GColors.textTitle,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minimumSize: Size(double.infinity, 55)),
                    child: Text(
                      GTexts.signIn,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: GColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      "Don't have account? Sign Up",
                      style: TextStyle(color: GColors.textTitle),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: TextStyle(color: GColors.textTitle),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Google",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
