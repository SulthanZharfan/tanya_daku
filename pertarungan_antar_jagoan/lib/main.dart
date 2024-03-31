import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh Icon Widget')),
        body: const Center(
          child: Icon(
            Icons.ac_unit,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
