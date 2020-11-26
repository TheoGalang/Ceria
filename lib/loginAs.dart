import 'package:ceria/loginPage.dart';
import 'package:ceria/screen_parent/parent_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen_guru/teacher_home.dart';

class LoginAs extends StatefulWidget {
  @override
  _LoginAsState createState() => _LoginAsState();
}

class _LoginAsState extends State<LoginAs> {
  Future<List<String>> checkCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("user");
  }

  @override
  void initState() {
    checkCurrentUser().then((value) {
      print(" sharedPreferences value form loginAs : $value");
      if (value != null) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (_) => value[3] == "parent" ? HomeParent() : Home(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 100, 30, 30),
                  width: 200,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => LoginPage(
                                    role: "teacher",
                                  )));
                    },
                    child: Text(
                      "Guru",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xff41348C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  width: 200,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => LoginPage(
                                    role: "parent",
                                  )));
                    },
                    child: Text(
                      "Orang Tua",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xff41348C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
