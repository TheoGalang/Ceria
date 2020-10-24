import 'package:ceria/screen_parent/tugas/detailtugas_parent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KumpulTugasParent extends StatefulWidget {
  @override
  _KumpulTugasParentState createState() => _KumpulTugasParentState();
}

class _KumpulTugasParentState extends State<KumpulTugasParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return DetailTugasParent();
              }));
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Pengumpulan Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tugas Matematika Deret Halaman 20",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xff41348C),
                                size: 15,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Kerjakan di Buku Tulis, Dikerjakan secara urut, Kerjakan hanya excersie 1",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff41348C),
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xff41348C),
                                size: 15,
                              ),
                            ),
                            Text(
                              "Deadline 18 September 2020",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 30, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailTugasParent();
                                  }));
                                }
                              },
                              child: Text(
                                "Komentar",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Pengumpulan",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: EdgeInsets.all(20),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ]),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color(0xff41348C),
                            size: 30,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      margin: EdgeInsets.all(50),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        onPressed: () {},
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xff41348C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
