import 'package:ceria/models/user.dart';
import 'package:ceria/screen_guru/teacher_home.dart';
import 'package:ceria/screen_parent/parent_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final String role;

  const LoginPage({Key key, this.role}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 30.0,
                                    offset: Offset(0, 10))
                              ],
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextField(
                            controller: username,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 30.0,
                                    offset: Offset(0, 10))
                              ],
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            User user = await User.login(
                                username: username.text,
                                password: password.text,
                                role: widget.role);

                            user.isLogin
                                ? Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => user.role == "parent"
                                          ? HomeParent()
                                          : Home(),
                                    ),
                                  )
                                : SweetAlert.show(
                                    context,
                                    title: "Login Gagal!",
                                    subtitle: "Username/Password salah!",
                                    style: SweetAlertStyle.error,
                                  );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff41348C),
                            ),
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  remember(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user.isLogin
        ? sharedPreferences.setStringList(
            "user", [user.nama, user.nik, user.username, user.role])
        : print("username password salah");
  }
}
