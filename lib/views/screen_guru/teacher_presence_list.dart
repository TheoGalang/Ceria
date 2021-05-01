import '../generalPage.dart';
import 'package:flutter/material.dart';

class ListStudentAbsen extends StatelessWidget {
  final String kelas;

  const ListStudentAbsen({Key key, this.kelas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Kehadiran Siswa',
      subJudul1: kelas ?? '',
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Text("NIM",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff41348C),
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("Nama",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                  Text("Status",
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
                  Text("Hadir",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
