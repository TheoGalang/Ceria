import '../../generalPage.dart';
import 'package:flutter/material.dart';

class ChooseHistoryTeacherRaport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Diri Sendiri',
      subJudul1: 'Identitas',
      child: Column(
        children: [
          Container(
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
              child: Text('Senin, 1 Maret 2021',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xff41348C),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Isi Nilai baru",
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
    );
  }
}
