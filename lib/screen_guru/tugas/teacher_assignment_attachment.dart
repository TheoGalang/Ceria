import 'package:ceria/screen_guru/tugas/detailtugas_teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LampiranTeacher extends StatelessWidget {
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
        title: Text("Lampiran"),
        backgroundColor: Color(0xff41348C),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
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
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[Container()],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
