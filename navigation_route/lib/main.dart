import 'package:flutter/material.dart';
import 'halaman_satu.dart';
import 'halaman_dua.dart';
import 'halaman_tiga.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator and Route Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PageOne(),
        '/page_two': (context) => PageTwo(),
        '/page_three': (context) => PageThree(),
      },
    );
  }
}
