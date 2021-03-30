import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class ChooseThemeTeacher extends StatefulWidget {
  @override
  _ChooseThemeTeacherState createState() => _ChooseThemeTeacherState();
}

class _ChooseThemeTeacherState extends State<ChooseThemeTeacher> {
  String _valsubTema;

  List _subTema = [
    "Identitas",
    "Bagian Tubuh",
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Pilih Tema dan Sub Tema',
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
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
        child: DropdownButton(
          dropdownColor: Colors.white,
          hint: Center(
            child: Text('Diri Sendiri',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff41348C),
                    fontWeight: FontWeight.bold)),
          ),
          value: _valsubTema,
          items: _subTema.map((value) {
            return DropdownMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _valsubTema = value;
            });
          },
        ),
      ),
    );
  }
}
