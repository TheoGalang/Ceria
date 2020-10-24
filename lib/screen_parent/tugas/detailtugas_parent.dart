import 'package:ceria/screen_parent/tugas/listtugas_parent.dart';
import 'package:ceria/screen_parent/tugas/pengumpulantugas_parent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTugasParent extends StatefulWidget {
  @override
  _DetailTugasParentState createState() => _DetailTugasParentState();
}

class _DetailTugasParentState extends State<DetailTugasParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ShowAssignmentParent();
                }));
              }
            },
          ),
        ),
        title: Text("Detail Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
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
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return KumpulTugasParent();
                                    }));
                                  }
                                },
                                child: Text(
                                  "Pengumpulan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff41348C),
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              "Kalau tidak urut tidak apa apa?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              "Boleh",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              "Boleh",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              "Kalau tidak urut tidak apa apa?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "ketik disini",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Color(0xff41348C),
                      size: 30,
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
