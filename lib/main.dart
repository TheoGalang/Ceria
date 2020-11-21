import 'package:ceria/screen_guru/home_guru.dart';
<<<<<<< HEAD
import 'package:ceria/screen_parent/home_parent.dart';
=======
import 'package:ceria/screen_guru/listkehadiran_guru.dart';
import 'package:ceria/screen_parent/daftarsiswa_parent.dart';
import 'package:ceria/screen_parent/home_parent.dart';
import 'package:ceria/screen_parent/isikehadiran_parent.dart';
>>>>>>> 76a6e45219e207fbc40e13c2463d6386734e26c0
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
<<<<<<< HEAD
      home: HomeParent(),
=======
      home: IsiKehadiranParent(),
>>>>>>> 76a6e45219e207fbc40e13c2463d6386734e26c0
      debugShowCheckedModeBanner: false,
    );
  }
}
