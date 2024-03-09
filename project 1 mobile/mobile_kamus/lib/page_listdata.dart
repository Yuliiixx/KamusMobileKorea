import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail_kosakata.dart';
import 'models/model_kosakata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Datum>?> getKosakata() async {
    try {
      final res =
          await http.get(Uri.parse('http://192.168.43.102/kamus/kosakata.php'));
      return modelKosakataFromJson(res.body).data;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getKosakata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kamus Indonesia Korea',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageSearchListData();
              }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getKosakata(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageDetailKosakata(data),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "${data?.indonesia}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            data?.korea ?? "",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          },
        ),
      ),
    );
  }
}

class PageSearchListData extends StatefulWidget {
  const PageSearchListData({Key? key}) : super(key: key);

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
    final response =
        await http.get(Uri.parse('http://192.168.43.102/kamus/kosakata.php'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
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
        title: Text(
          'Kamus Indonesia Korea',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
                final kosakata = _filteredKosakataList[index];
                return ListTile(
                  title: Text(
                    kosakata['indonesia'],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Membuat instance Datum dari _JsonMap
                    Datum datum = Datum.fromJson(kosakata);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageDetailKosakata(datum),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
