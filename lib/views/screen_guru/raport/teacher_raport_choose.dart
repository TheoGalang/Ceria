import 'package:ceria/tools/theme.dart';
import 'package:ceria/views/generalPage.dart';
import 'package:ceria/views/screen_guru/raport/teacher_choose_theme.dart';
import 'package:flutter/material.dart';

import '../teacher_chooseclass.dart';

class TeacherChooseOptionRaport extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: 'Raport',
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 100, 30, 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TeacherChooseTheme(),
                  ),
                );
              },
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
              onTap: () {
                onAddThemeButtonPressed(context: context, formKey: _formKey);
              },
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChooseClassTeacher()));
              },
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

  void onAddThemeButtonPressed(
      {BuildContext context, GlobalKey<FormState> formKey}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.close,
                        color: whiteColor,
                      ),
                      backgroundColor: mainColor,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Tema",
                          style: greyFontStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color(0xff41348C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width)),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  print("validation true");
                                  formKey.currentState.save();
                                } else {
                                  print("validation false");
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
