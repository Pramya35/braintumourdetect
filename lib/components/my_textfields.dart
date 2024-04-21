import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final Color? color;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obsecureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: color,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
