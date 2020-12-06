import 'package:ceria/tools/constants.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'teacher_assignment_givingscore.dart';

class DetailTugasTeacher extends StatelessWidget {
  final Assignment assignment;
  final int classId;

  DetailTugasTeacher({this.assignment, this.classId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
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
                      "${this.assignment.title}",
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
                          "${constKelas[this.classId].namaKelas}",
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
                          "${this.assignment.description}",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: null,
                          child: Text(
                            "Pengumpulan",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      {
                        Navigator.push(context,
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
                        Navigator.push(context,
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
                        Navigator.push(context,
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Detail Tugas"),
      elevation: 0,
      backgroundColor: Color(0xFF41348C),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
