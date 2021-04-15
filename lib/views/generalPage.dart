import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget {
  final String judul;
  final String subJudul1;
  final Widget child;
  final String subJudul2;
  final Widget floatingActionButton;

  const GeneralPage(
      {Key key,
      this.judul,
      this.subJudul1,
      this.child,
      this.subJudul2,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton ?? SizedBox(),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xff41348C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          judul ?? '',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subJudul1 ?? '',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subJudul2 ?? '',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [child ?? SizedBox()],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
