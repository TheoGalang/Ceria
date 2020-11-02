import 'package:flutter/material.dart';

import 'screen_parent/tugas/listtugas_parent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowAssignmentParent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
