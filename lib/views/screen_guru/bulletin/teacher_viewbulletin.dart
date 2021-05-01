import '../../generalPage.dart';
import 'package:flutter/material.dart';

class ViewBulletinTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: "View Bulletin",
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
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
              child: Text('Create Bulletin',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold)),
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
    );
  }
}
