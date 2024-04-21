import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const DetailsScreen({super.key, required this.title, required this.content});

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
