import 'package:ceria/screen_guru/tugas/detailtugas_teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IsiNilaiTeacher extends StatefulWidget {
  @override
  _IsiNilaiTeacherState createState() => _IsiNilaiTeacherState();
}

class _IsiNilaiTeacherState extends State<IsiNilaiTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return DetailTugasTeacher();
              }));
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Nilai Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
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
                          "Theo Galang Saputra",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
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
                          "20 Menit Yang Lalu",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ]),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Color(0xff41348C),
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ]),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                hintText: "Nilai",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ]),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Color(0xff41348C),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                          hintText: "Feedback",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
