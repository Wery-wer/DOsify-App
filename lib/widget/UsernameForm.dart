import 'package:flutter/material.dart';
import 'package:dosify_app/utils/constants/colors.dart';

class UsernameForm extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const UsernameForm(
      {super.key, required this.hintText, required this.controller});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
            // color: Color.fromARGB(255, 0, 0, 0),
            ),
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 15), //Change this value to custom as you like
          // isDense: true,
          filled: true,
          fillColor: GColors.textTitle,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 70),
          prefixIcon: Icon(Icons.person_2_outlined),
          prefixIconColor: Color.fromARGB(137, 191, 187, 187),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(131, 138, 124, 124), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(249, 247, 220, 220), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
