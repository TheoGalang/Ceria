import 'package:ceria/tools/theme.dart';
import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class TeacherIndicator extends StatefulWidget {
  @override
  _TeacherIndicatorState createState() => _TeacherIndicatorState();
}

class _TeacherIndicatorState extends State<TeacherIndicator> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          onAddButtonPressed(context: context, formKey: _formKey);
        },
        child: Icon(
          Icons.add_rounded,
          color: mainColor,
          size: MediaQuery.of(context).size.width / 8,
        ),
        backgroundColor: whiteColor,
      ),
      judul: 'Diri Sendiri',
      subJudul1: 'Identitas',
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
        ],
      ),
    );
  }

  void onAddButtonPressed(
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
                          "Indikator",
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
                                  formKey.currentState.save();
                                }
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
