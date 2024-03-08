import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_kamus/models/model_kosakata.dart';

class PageDetailKosakata extends StatelessWidget {
  final Datum? data;

  const PageDetailKosakata(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Kosakata",
          style: TextStyle(
            color: Colors.white, // Warna teks
          ),
        ),
        backgroundColor: Colors.purple, // Warna latar belakang
      ),
      body: ListView(
        children: [
          Text(
            data?.indonesia ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            data?.korea ?? "",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.left,
          ),
          Text(
            data?.hangeul ?? "",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
