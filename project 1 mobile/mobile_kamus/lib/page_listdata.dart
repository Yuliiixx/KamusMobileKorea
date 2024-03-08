import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/model_kosakata.dart';

class PageSearchListData extends StatefulWidget {
  const PageSearchListData({super.key});

  @override
  State<PageSearchListData> createState() => _PageSearchListDataState();
}

class _PageSearchListDataState extends State<PageSearchListData> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _kosakataList = [];
  List<dynamic> _filteredKosakataList = [];

  @override
  void initState() {
    super.initState();
    fetchKosakata();
  }

  Future<void> fetchKosakata() async {
    final response = await http.get(Uri.parse('http://192.168.43.102/kamus/kosakata.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        _kosakataList = responseData['data'];
        _filteredKosakataList = _kosakataList;
      });
    } else {
      throw Exception('Failed to load kosakata');
    }
  }

  void _filterKosakata(String query) {
    setState(() {
      _filteredKosakataList = _kosakataList
          .where((kosakata) =>
          kosakata['indonesia'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Vocabulary'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterKosakata(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: _filteredKosakataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_filteredKosakataList[index]['indonesia']),
                    subtitle: Text(_filteredKosakataList[index]['korea']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
