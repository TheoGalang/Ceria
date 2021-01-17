import 'package:ceria/loginAs.dart';
import 'package:ceria/tools/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO A : Jika mau manjalankan di device (release mode)  uncomment code ini, dan comment todo B
  await initializeDateFormatting("id_ID", null)
      .then((value) => runApp(MyApp()));

  // TODO B : jika  mau menjalankan di emulator uncomment code ini dan comment todo A
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
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
      debugShowCheckedModeBanner: false,
    );
  }
}

void logOut({BuildContext context}) async {
  SharedPreferences cookies = await SharedPreferences.getInstance();

  cookies.remove("role");
  cookies.remove("nomorInduk");

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (_) => LoginAs()));
}

String greetings() {
  int jam = DateTime.now().add(Duration(hours: 7)).hour;

  if (jam >= 4 && jam <= 10) {
    return "Selamat Pagi, ";
  } else if (jam > 10 && jam <= 14) {
    return "Selamat Siang, ";
  } else if (jam > 14 && jam <= 18) {
    return "Selamat Sore, ";
  } else {
    return "Selamat Malam, ";
  }
}
