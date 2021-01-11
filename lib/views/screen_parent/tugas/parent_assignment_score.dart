import 'package:ceria/models/assignments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NilaiTugasParent extends StatefulWidget {
  final Data assignment;
  final String nis;
  final int idKelas;

  const NilaiTugasParent({Key key, this.assignment, this.nis, this.idKelas})
      : super(key: key);
  @override
  _NilaiTugasParentState createState() => _NilaiTugasParentState();
}

class _NilaiTugasParentState extends State<NilaiTugasParent> {
  @override
  Widget build(BuildContext context) {
    var assignmentData = this.widget.assignment;
    DateTime date = DateTime.parse(assignmentData.dueDate);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Nilai Tugas"),
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
                            "${assignmentData.title}",
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
                                    assignmentData.title,
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
                                "Deadline  " +
                                    DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                        .format(date),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        buildContainerNilai(context, assignmentData),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                            child: Text(
                              "Komentar",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold),
                            )),
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

  Widget buildContainerNilai(BuildContext context, Data assignmentData) {
    DateTime deadline = DateTime.parse(assignmentData.dueDate);

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: assignmentData.grade != null && assignmentData.grade > 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    "${assignmentData.grade}",
                    style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff41348C),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${assignmentData.title}",
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
                          "Deadline  " +
                              DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                  .format(deadline),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Mohon tunggu hasil pemeriksaan dari guru.",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
