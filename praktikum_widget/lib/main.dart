import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Favorit'),
      ),
      body: const Center(
        child: Text('Halo ini halaman favoritku'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // membuat daftar thumbnail
  final List<String> thumbList = [
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/img.png'),
            const SizedBox(height: 10),
            const Text("Logo Universitas Pancasila"),
            Expanded(
              child: GridView.count(
                shrinkWrap: true, // Supaya Grid bisa di scroll jika besar
                crossAxisCount: 3,
                children: List.generate(thumbList.length, (index) {
                  return Image.asset(thumbList[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
