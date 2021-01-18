import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final Widget child;

  const NoInternetConnection({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var vw = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: Container(
        color: Colors.indigo[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 25 * vw,
                color: Color(0xff41348C),
              ),
              Text(
                "Tidak dapat terhubung ke internet.",
                style: TextStyle(fontSize: 3 * vw),
              ),
              Container(
                margin: EdgeInsets.only(top: 10 * vw),
                width: 50 * vw,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, CupertinoPageRoute(builder: (_) => child));
                  },
                  child: Text(
                    "Coba lagi",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Color(0xff41348C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5 * vw)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
