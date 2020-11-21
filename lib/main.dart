import 'package:ceria/screen_guru/home_guru.dart';
import 'package:ceria/screen_parent/home_parent.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ShowAssignment(
      //   kelas: constKelas[1],
      // ),
      home: HomeParent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
