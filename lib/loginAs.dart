import 'package:flutter/material.dart';

class LoginAs extends StatelessWidget {
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
                      // Navigator.pop(context);
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
                      // Navigator.pop(context);
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
