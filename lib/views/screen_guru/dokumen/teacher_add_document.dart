import 'package:flutter/material.dart';

class CreateDocumentTeacher extends StatefulWidget {
  @override
  _CreateDocumentTeacherState createState() => _CreateDocumentTeacherState();
}

class _CreateDocumentTeacherState extends State<CreateDocumentTeacher> {
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
                  child: Text('Judul Dokumen',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Judul Dokumen",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    // onChanged: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Expanded(
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          hintText: "Deskripsi dokumen",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      // onChanged: () {},
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Text('Masukkan Foto',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: MediaQuery.of(context).size.width / 1.2,
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff41348C),
                    ),
                    onPressed: null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Center(
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
      title: Text("Tambah Dokumen"),
      backgroundColor: Color(0xff41348C),
    );
  }
}
