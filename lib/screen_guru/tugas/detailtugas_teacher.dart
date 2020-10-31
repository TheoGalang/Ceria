import 'package:ceria/screen_guru/tugas/isinilai_teacher.dart';
import 'package:ceria/screen_guru/tugas/lampiran_teacher.dart';
import 'package:ceria/screen_guru/tugas/listtugas_guru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTugasTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ShowAssignment();
              }));
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Detail Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                          "Kelas 12 IPA 1",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.normal),
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
                                return DetailTugasTeacher();
                              }));
                            }
                          },
                          child: Text(
                            "Pengumpulan",
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
                                return LampiranTeacher();
                              }));
                            }
                          },
                          child: Text(
                            "Lampiran",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return IsiNilaiTeacher();
                        }));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.fromLTRB(35, 0, 25, 0),

                            child: Text("105217040",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Text("Theo Galang Saputra",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return IsiNilaiTeacher();
                        }));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.fromLTRB(35, 0, 25, 0),

                            child: Text("105217040",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Text("Theo Galang Saputra",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return IsiNilaiTeacher();
                        }));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.fromLTRB(35, 0, 25, 0),

                            child: Text("105217040",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Text("Theo Galang Saputra",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
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
    );
  }
}
