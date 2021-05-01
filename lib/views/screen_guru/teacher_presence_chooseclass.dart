import '../generalPage.dart';
import 'package:flutter/material.dart';

class ChooseClassTeacherAbsen extends StatelessWidget {
  final String namaKelas;

  const ChooseClassTeacherAbsen({Key key, this.namaKelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Pilih Kelas',
      subJudul1: '',
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
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
          child: Text(namaKelas ?? '',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff41348C),
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
