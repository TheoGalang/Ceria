import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseClassTeacherAbsen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
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
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pilih Kelas",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pertemuan Minggu 1",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Kelas 11 IPA 1",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Center(
                          child: Text("2 Tugas Aktif",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Kelas 12 IPA 2",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Center(
                          child: Text("3 Tugas Aktif",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Kelas 11 IPA 2",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Center(
                          child: Text("2 Tugas Aktif",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Kelas 12 IPA 1",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Center(
                          child: Text("0 Tugas Aktif",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
