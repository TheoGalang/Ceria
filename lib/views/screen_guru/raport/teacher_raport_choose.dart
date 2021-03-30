import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class ChooseOptionRaport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Rapot',
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 100, 30, 30),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                width: MediaQuery.of(context).size.width / 1.5,
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
                child: Center(
                  child: Text('Tambah Indikator',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                width: MediaQuery.of(context).size.width / 1.5,
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
                child: Center(
                  child: Text('Tambah Tema',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                width: MediaQuery.of(context).size.width / 1.5,
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
                child: Center(
                  child: Text('Isi Nilai Siswa',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
