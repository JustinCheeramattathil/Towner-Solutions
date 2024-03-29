import 'package:flutter/material.dart';

class DateTextfield extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback onPressed;

  const DateTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(0, 4))
          ],
        ),
        child: TextField(
          keyboardType: TextInputType.datetime,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            // suffixIcon: InkWell(
            //     onTap: onPressed, child: const Icon(Icons.calendar_month)),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color:  Color.fromARGB(255, 20, 0, 2), width: 2),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ),
      ),
    );
  }
}
