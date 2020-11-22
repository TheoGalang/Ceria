import 'package:ceria/screen_parent/home_parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final color = MaterialColor(
    0xFF41348C,
    const <int, Color>{
      50: const Color(0xFF41348C),
      100: const Color(0xFF41348C),
      200: const Color(0xFF41348C),
      300: const Color(0xFF41348C),
      400: const Color(0xFF41348C),
      500: const Color(0xFF41348C),
      600: const Color(0xFF41348C),
      700: const Color(0xFF41348C),
      800: const Color(0xFF41348C),
      900: const Color(0xFF41348C),
    },
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));
    return MaterialApp(
      title: "CERIA",
      theme: ThemeData(primarySwatch: color),
      home: HomeParent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
