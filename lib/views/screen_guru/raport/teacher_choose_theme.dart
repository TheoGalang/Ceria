import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:ceria/models/raport_teacher/tema.dart';

import 'viewModel/teacher_choose_theme_viewModel.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'teacher_indicator.dart';
import 'package:flutter/material.dart';

class TeacherChooseTheme extends StatefulWidget {
  @override
  _TeacherChooseThemeState createState() => _TeacherChooseThemeState();
}

class _TeacherChooseThemeState extends State<TeacherChooseTheme> {
  String _valTema;
  int temaIDChoosed;
  List _listTema = [
    "Identitas",
    "Bagian Tubuh",
  ];
  List _listSubTema = [];

  String _valSubTema;

  int subTemaIDChoosed;

  initiateListTema(Tema tema) {
    _listTema = [];
    for (var item in tema.data) {
      _listTema.add(item.title);
    }
  }

  initiateListSubTema(SubTema subTema) {
    _listSubTema = [];
    if (subTema.data.length <= 0) {
      // _listSubTema.add("Tidak ada sub tema.");
    } else {
      for (var item in subTema.data) {
        _listSubTema.add(item.title);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherRaportChooseThemeViewModel>.reactive(
      viewModelBuilder: () => TeacherRaportChooseThemeViewModel(),
      onModelReady: (model) async {
        await model.initial(context: context);
        initiateListTema(model.tema ?? Tema());
        // initiateListSubTema(model.subTema ?? SubTema());
      },
      builder: (_, model, __) => GeneralPage(
        floatingActionButton: FloatingActionButton(
          onPressed: temaIDChoosed == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TeacherIndicator(
                              idTema: temaIDChoosed,
                              idSubTema: model.subTema.data[0].id,
                              tema: this._valTema,
                              subTema: model.subTema.data[0].title,
                            )),
                  );
                },
          child: Text("Next"),
        ),
        judul: 'Pilih Tema dan Sub Tema',
        child: Column(
          children: [
            Container(
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
                isExpanded: true,
                hint: Center(
                  child: Text('Pilih Tema!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                value: _valTema,
                items: _listTema.length <= 0
                    ? []
                    : _listTema.map((value) {
                        return DropdownMenuItem(
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                          value: value,
                        );
                      }).toList(),
                onChanged: (value) async {
                  var index = model?.tema?.data
                      ?.indexWhere((element) => element.title == value);
                  this.temaIDChoosed = model?.tema?.data[index]?.id ?? 0;
                  await model.getSubTema(this.temaIDChoosed ?? 1);
                  initiateListSubTema(model?.subTema ?? SubTema());

                  setState(() {
                    _valTema = value;
                  });
                },
              ),
            ),
            //  dropdown untuk subtema
            Container(
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
              child: _listSubTema.length == 0
                  ? Text("Tidak ada sub tema")
                  : _listSubTema.length == 1
                      ? Text(_listSubTema.first.toString())
                      : DropdownButton(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          hint: Center(
                            child: Text('Pilih Sub Tema!',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                          value: _valSubTema,
                          items: _listSubTema.map((value) {
                            return DropdownMenuItem(
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff41348C),
                                      fontWeight: FontWeight.bold)),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) async {
                            var index = model?.subTema?.data?.indexWhere(
                                (element) => element.title == value);
                            this.subTemaIDChoosed =
                                model?.subTema?.data[index]?.id ?? 0;

                            setState(() {
                              _valSubTema = value;
                            });
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
