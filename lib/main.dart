import 'package:ceria/screen_parent/tugas/detailtugas_parent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailTugasParent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
