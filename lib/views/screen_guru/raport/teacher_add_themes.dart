import 'package:flutter/material.dart';

class TeacherAddThemes extends StatefulWidget {
  @override
  _TeacherAddThemesState createState() => _TeacherAddThemesState();
}

class _TeacherAddThemesState extends State<TeacherAddThemes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Text('Judul Tema',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Judul Tema",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    // onChanged: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Judul Sub Tema',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Judul Sub Tema",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    // onChanged: () {},
                  ),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xff41348C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          {
            Navigator.pop(context);
          }
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text("Tambah Tema"),
      backgroundColor: Color(0xff41348C),
    );
  }
}
