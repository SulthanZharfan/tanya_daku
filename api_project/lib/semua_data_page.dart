import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SemuaDataPage extends StatefulWidget {
  @override
  _SemuaDataPageState createState() => _SemuaDataPageState();
}

class _SemuaDataPageState extends State<SemuaDataPage> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final url = Uri.parse('https://latihan.majuraya.com/get_data.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semua Data'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView( // Tambahkan SingleChildScrollView
        child: Column(
          children: _data.map((item) {
            return ListTile(
              title: Text(item['nama']),
              subtitle: Text(item['email']),
              trailing: Text(item['alamat']),
            );
          }).toList(),
        ),
      ),
    );
  }
}
