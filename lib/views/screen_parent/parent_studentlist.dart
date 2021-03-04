import 'package:ceria/models/students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListStudentParent extends StatelessWidget {
  final Students students;
  final String className;
  final int classId;

  const ListStudentParent(
      {Key key, this.students, this.className, this.classId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Studnt length: " + students.data.length.toString());

    List<Container> siswa = [];

    for (var student in students?.data ?? []) {
      if (student.idKelas == this.classId) {
        siswa.add(Container(
          width: MediaQuery.of(context).size.width / 1,
          margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(student.nomorInduk,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(student.nama,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
      }
    }
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
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Daftar Siswa",
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
                      "Kelas $className",
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
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                    children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1,
                                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text("No Absen",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff41348C),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Nama Siswa",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff41348C),
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] +
                            siswa ??
                        []),
              ),
            ),
          )
        ],
      )),
    );
  }
}
