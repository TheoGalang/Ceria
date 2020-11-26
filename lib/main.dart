import 'package:ceria/loginAs.dart';
import 'package:ceria/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(true.toString());
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));
    return MaterialApp(
      title: "CERIA",
      theme: ThemeData(primarySwatch: color),
      home: LoginAs(),
      debugShowCheckedModeBanner: false,
    );
  }
}
