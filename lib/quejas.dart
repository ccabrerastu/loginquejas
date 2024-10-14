import 'package:flutter/material.dart';

class QuejasPage extends StatelessWidget {
  final String title;

  const QuejasPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'Aquí puedes presentar tus quejas.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
