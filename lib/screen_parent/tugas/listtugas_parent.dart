import 'package:ceria/screen_parent/home_parent.dart';
import 'package:ceria/screen_parent/tugas/detailtugas_parent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAssignmentParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xff41348C),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomeParent();
                                }));
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text(
                          "Theo Galang Saputra",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text(
                          "Kamis, 17 September 2020",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text(
                          "Nama Kelas",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: ListView(
                children: [
                  Container(
                    color: Color(0xffF3F3F8),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                          child: Text(
                            "TUGAS SELESAI",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailTugasParent();
                              }));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Tugas matematika deret halaman 20",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff41348C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Deadline 18 September 2020",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff41348C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                          child: Text(
                            "TUGAS BELUM SELESAI",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailTugasParent();
                              }));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Tugas matematika deret halaman 20",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff41348C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Deadline 18 September 2020",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff41348C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailTugasParent();
                              }));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Tugas matematika deret halaman 20",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff41348C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Deadline 18 September 2020",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff41348C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
