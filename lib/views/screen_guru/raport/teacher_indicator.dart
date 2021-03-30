import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class TeacherIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Diri Sendiri',
      subjudul: 'Identitas',
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
              alignment: Alignment.topLeft,
              child: Text('Nama Indikator',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold))),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: MediaQuery.of(context).size.width / 1,
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
              child: Text('Anak mampu mengucapkan kalimat Syahadat',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 30, 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Icon(Icons.add),
                backgroundColor: Color(0xff41348C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
