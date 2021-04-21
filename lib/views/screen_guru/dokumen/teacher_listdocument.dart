import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class ListDocumentTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: "List Dokumen",
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 45, 0),
                    child: Text("Nomor",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff41348C),
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("Nama Dokumen",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 60, 0),
                    child: Text("1",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  Text("Rekreasi Kebun Binatang",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(30),
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xff41348C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Tambah",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
