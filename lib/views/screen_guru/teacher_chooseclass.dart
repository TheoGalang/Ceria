import '../generalPage.dart';
import 'package:flutter/material.dart';

import 'raport/teacher_studentlist_rapot.dart';

class ChooseClassTeacher extends StatelessWidget {
  final String namaKelas;

  const ChooseClassTeacher({Key key, this.namaKelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Pilih Kelas',
      subJudul1: '',
      child: Container(
        margin: EdgeInsets.only(top: 16),
        // padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
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
        child: Column(
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TeacherRaportListStudent(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                width: double.infinity,
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
                  child: Text('Kelas $index',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
