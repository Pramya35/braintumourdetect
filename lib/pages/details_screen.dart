import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const DetailsScreen({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
