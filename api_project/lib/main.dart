import 'package:flutter/material.dart';
import 'input_data_page.dart';
import 'semua_data_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputDataPage(),
        '/semua_data': (context) => SemuaDataPage(),
      },
    );
  }
}
