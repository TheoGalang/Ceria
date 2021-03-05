import 'package:ceria/loginPage.dart';
import 'package:ceria/providers/loginaAs_viewModel.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'providers/login_viewmodel.dart';

class LoginAs extends StatefulWidget {
  @override
  _LoginAsState createState() => _LoginAsState();
}

class _LoginAsState extends State<LoginAs> {
  Future<List<String>> checkCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("user");
  }

  Future<String> getRole() async {
    SharedPreferences cookies = await SharedPreferences.getInstance();
    return cookies.getString("role");
  }

  Future<String> getNomorInduk() async {
    SharedPreferences cookies = await SharedPreferences.getInstance();
    return cookies.getString("nomorInduk");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginAsViewModel>.reactive(
      viewModelBuilder: () => LoginAsViewModel(),
      onModelReady: (model) async {
        await model.initial(context: context);
      },
      builder: (_, model, __) => Scaffold(
        backgroundColor: Colors.white,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text("Tekan sekali lagi untuk keluar."),
          ),
          child: Container(
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => LoginPage(
                                        role: Role.teacher,
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) =>
                                      LoginPage(role: Role.parent)));
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
        ),
      ),
    );
  }
}
