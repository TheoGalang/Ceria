import 'package:ceria/loginAs.dart';
import 'package:ceria/providers/parent/parent_home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'tugas/parent_assignment_list.dart';

class HomeParent extends StatelessWidget {
  final String nik;

  const HomeParent({Key key, this.nik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParentHomeViewModel>.reactive(
      viewModelBuilder: () => ParentHomeViewModel(nik: nik),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
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
                        child: IconButton(
                          icon: Icon(
                            Icons.notification_important,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            // print("logout");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginAs(),
                                ));
                          },
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
                          model?.parent?.data?.nama ?? "",
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
                            DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                .format(DateTime.now()),
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
                            model?.kelas?.data?.kelas ?? "",
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
                              Text("Kehadiran",
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
                              return ShowAssignmentParent(
                                nis: model?.child?.data?.nomorInduk,
                                idKelas: model?.kelas?.data?.id,
                              );
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  padding: EdgeInsets.all(20),
                                  child: Icon(
                                    Icons.file_present,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                Text("Tugas",
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
      ),
    );
  }
}
