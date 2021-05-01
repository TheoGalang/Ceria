import 'package:sweetalert/sweetalert.dart';

import '../../../models/raport_teacher/indicators.dart';
import 'viewModel/teacher_raport_list_indicator_viewModel.dart';
import 'package:stacked/stacked.dart' show ViewModelBuilder;

import '../../../tools/theme.dart';
import '../../generalPage.dart';
import 'package:flutter/material.dart';

class TeacherIndicator extends StatefulWidget {
  final int idTema;
  final int idSubTema;
  final String tema;
  final String subTema;

  const TeacherIndicator(
      {Key key, this.idTema = 1, this.idSubTema = 1, this.tema, this.subTema})
      : super(key: key);
  @override
  _TeacherIndicatorState createState() => _TeacherIndicatorState();
}

class _TeacherIndicatorState extends State<TeacherIndicator> {
  final _formKey = GlobalKey<FormState>();
  List<String> _listIndicator = [];

  initiateListIndicator(Indicators indicators) {
    _listIndicator = [];
    for (var indicator in indicators.data) {
      _listIndicator.add(indicator.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherRaportIndicator>.reactive(
      viewModelBuilder: () => TeacherRaportIndicator(
        idTema: widget.idTema,
        idSubTema: widget.idSubTema,
      ),
      onModelReady: (model) async {
        await model.initial();
        initiateListIndicator(model?.indicators ?? Indicators());
      },
      builder: (_, model, __) => GeneralPage(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onAddButtonPressed(
                context: context, formKey: _formKey, model: model);

            // initiateListIndicator(model?.indicators ?? Indicators());
          },
          child: Icon(
            Icons.add_rounded,
            color: mainColor,
            size: MediaQuery.of(context).size.width / 8,
          ),
          backgroundColor: whiteColor,
        ),
        judul: widget?.tema ?? 'Tema',
        subJudul1: widget?.subTema ?? 'Sub Tema',
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
                child: Column(
                  children: _listIndicator.length > 0
                      ? _listIndicator
                          .map((e) => Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Text(e,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff41348C),
                                        fontWeight: FontWeight.bold)),
                              ))
                          .toList()
                      : [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Text("Belum Ada Indikator",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAddButtonPressed(
      {BuildContext context,
      GlobalKey<FormState> formKey,
      TeacherRaportIndicator model}) {
    String newIndicator;

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
                        child: TextFormField(
                          onChanged: (value) {
                            print("TextFormField: $value");
                            setState(() {
                              newIndicator = value;
                            });
                          },
                        ),
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
                              onPressed: () async {
                                setState(() {});
                                if (newIndicator.length > 0) {
                                  var result = await model.createNewIndicator(
                                      newIndicator: newIndicator);

                                  if (result) {
                                    SweetAlert.show(context,
                                        title: "Berhasil",
                                        subtitle:
                                            "Berhasil menambahkan indikator baru",
                                        style: SweetAlertStyle.success,
                                        onPress: (confirm) {
                                      Navigator.pop(context);
                                      return confirm;
                                    });
                                  } else {
                                    SweetAlert.show(context,
                                        title: "Gagal",
                                        subtitle: "Coba lagi nanti!",
                                        style: SweetAlertStyle.error,
                                        onPress: (confirm) {
                                      Navigator.pop(context);
                                      return confirm;
                                    });
                                  }

                                  await model.initial();

                                  initiateListIndicator(
                                      model?.indicators ?? Indicators());
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
