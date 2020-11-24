import 'package:ceria/screen_guru/tugas/teacher_assignment_chooseclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
                padding: EdgeInsets.fromLTRB(50, 15, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xff41348C),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.notification_important,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Assalamualaikum,",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Guru",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
              flex: 3,
              child: Container(
                color: Color(0xffF3F3F8),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.emoji_people_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("kehadiran",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChooseClassTeacherTugas();
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff41348C),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  Icons.file_present,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              Text("tugas",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff41348C),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.school,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("Rapot",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.account_balance_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("Kelas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.campaign_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("Bulletin",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.assignment_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("Dokumen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff41348C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                              padding: EdgeInsets.all(20),
                              child: Icon(
                                Icons.alarm,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Text("Reminder",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Text("Pengumuman",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: Text("Rapat Online Bersama Kepala Sekolah",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: Text("13.00",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: Text("Via Google Meet",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                  color: Color(0xffF3F3F8),
                )),
          ],
        ),
      ),
    );
  }
}
