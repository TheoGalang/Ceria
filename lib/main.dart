import 'package:ceria/loginAs.dart';
import 'package:ceria/tools/constants.dart';
import 'package:ceria/views/screen_parent/parent_home_alter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting("id_ID", null)
  //     .then((value) => runApp(MyApp()));
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));

    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      title: "CERIA",
      theme: ThemeData(primarySwatch: color),
      home: LoginAs(),
      // home: ParentHomeAlter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
