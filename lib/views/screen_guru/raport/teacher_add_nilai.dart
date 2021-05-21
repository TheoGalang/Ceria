import 'package:ceria/models/raport_teacher/indicators.dart';
import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:ceria/models/raport_teacher/tema.dart';
import 'package:ceria/views/screen_guru/raport/viewModel/teacher_raport_add_nilai_viewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:sweetalert/sweetalert.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

class TeacherRaportAddNilai extends StatefulWidget {
  final String namaSiswa;
  final String nis;

  const TeacherRaportAddNilai(
      {Key key, @required this.namaSiswa, @required this.nis})
      : super(key: key);

  @override
  _TeacherRaportAddNilaiState createState() => _TeacherRaportAddNilaiState();
}

class _TeacherRaportAddNilaiState extends State<TeacherRaportAddNilai> {
  bool _visible = false;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  List _subNilai = [
    "MB",
    "MSH",
    "BB",
  ];

  // variable untuk get tema dan subtema
  String _valTema;
  int temaIDChoosed;
  List _listTema = [
    "Identitas",
    "Bagian Tubuh",
  ];
  List _listSubTema = [];

  String _valSubTema;

  int subTemaIDChoosed = 0;

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
  // akhir variabel untuk get tema dan sub tema

  // untuk menampung banyak nilai
  List<Nilai> _listNilai = [];
  initiateListNilai(Indicators indikator) {
    _listNilai = [];
    for (var item in indikator.data) {
      _listNilai.add(Nilai(id: item.id, nilai: _subNilai[0]));
    }
  }

  bool _isButtonSubmitPressed = false;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return ViewModelBuilder<TeacherRaportAddNilaiViewModel>.reactive(
      viewModelBuilder: () => TeacherRaportAddNilaiViewModel(),
      onModelReady: (model) async {
        await model.initial();
        initiateListTema(model.tema);
      },
      builder: (_, model, __) => GeneralPage(
        judul: "Pengisian Nilai",
        subJudul1: widget.namaSiswa,
        floatingActionButton: !_visible
            ? null
            : RaisedButton(
                onPressed: () async {
                  setState(() {
                    _isButtonSubmitPressed = true;
                  });
                  // post nilai
                  var status = await model.postManyNilai(
                    idTema: temaIDChoosed,
                    idSubTema: subTemaIDChoosed,
                    values: _listNilai,
                    nis: widget.nis,
                  );

                  if (status) {
                    SweetAlert.show(context,
                        title: "Berhasil",
                        subtitle: "Isi nilai berhasil.",
                        style: SweetAlertStyle.success, onPress: (confirm) {
                      return confirm;
                    });
                  } else {
                    SweetAlert.show(context,
                        title: "Gagal",
                        subtitle: "Coba lagi nanti!",
                        style: SweetAlertStyle.error, onPress: (confirm) {
                      return confirm;
                    });
                  }
                  setState(() {
                    _isButtonSubmitPressed = false;
                  });
                },
                color: Color(0xff41348C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  _isButtonSubmitPressed ? "Loading..." : "Simpan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text("Tema / Sub Tema",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff41348C),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggle,
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.fromLTRB(40, 0, 40, 8),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
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
                  children: [
                    // dropdown tema
                    DropdownButton(
                      dropdownColor: Colors.white,
                      hint: Center(
                        child: Text('Pilih Tema!',
                            style: TextStyle(
                                fontSize: 14,
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
                                        fontSize: 14,
                                        color: Color(0xff41348C),
                                        fontWeight: FontWeight.bold)),
                                value: value,
                              );
                            }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _visible = false;
                          _valTema = null;
                          _valSubTema = null;
                        });

                        var index = model?.tema?.data
                            ?.indexWhere((element) => element.title == value);
                        this.temaIDChoosed = model?.tema?.data[index]?.id ?? 0;
                        await model.getSubTema(this.temaIDChoosed ?? 1);
                        initiateListSubTema(model?.subTema ?? SubTema());

                        if (model.subTema.data.length == 1) {
                          //  Get all indikator
                          await model.getIndikator(
                            idTema: this.temaIDChoosed,
                            idSubTema: model.subTema.data[0].id,
                          );
                          initiateListNilai(model.indicators);
                          _toggle();

                          setState(() {
                            subTemaIDChoosed = model.subTema.data[0].id;
                            _valSubTema = model.subTema.data[0].title;
                          });
                        }
                        setState(() {
                          _valTema = value;
                        });
                      },
                    ),

                    // akhir dropdown tema

                    // dropdown subtema
                    _listSubTema.length == 0
                        ? Text("Tidak ada sub tema")
                        : _listSubTema.length == 1
                            ? Text(_listSubTema.first.toString(),
                                style: TextStyle(
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold))
                            : DropdownButton(
                                dropdownColor: Colors.white,
                                hint: Center(
                                  child: Text('Pilih Sub Tema!',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff41348C),
                                          fontWeight: FontWeight.bold)),
                                ),
                                value: _valSubTema,
                                items: _listSubTema.map((value) {
                                  return DropdownMenuItem(
                                    child: Text(value,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff41348C),
                                            fontWeight: FontWeight.bold)),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) async {
                                  setState(() {
                                    _visible = false;
                                    _valSubTema = null;
                                  });
                                  var index = model?.subTema?.data?.indexWhere(
                                      (element) => element.title == value);
                                  this.subTemaIDChoosed =
                                      model?.subTema?.data[index]?.id ?? 0;

                                  // get all indikator
                                  await model.getIndikator(
                                      idTema: temaIDChoosed,
                                      idSubTema: subTemaIDChoosed);
                                  initiateListNilai(model.indicators);

                                  _toggle();

                                  setState(() {
                                    _valSubTema = value;
                                  });
                                },
                              ),

                    // akhir dropdown subtema
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: _visible,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text("Indikator",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff41348C),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text("Nilai",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: _visible,
                    child: Column(
                      children: [
                        ...model?.indicators?.data?.map((indikator) {
                              int index =
                                  model?.indicators?.data?.indexOf(indikator) ??
                                      0;

                              return Container(
                                width: MediaQuery.of(context).size.width / 1,
                                margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Expanded(
                                        child: Text(indikator.description,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: DropdownButton(
                                        dropdownColor: Colors.white,
                                        hint: Center(
                                          child: Text(
                                            '',
                                          ),
                                        ),
                                        value: _listNilai[index]?.nilai ?? "MB",
                                        items: _subNilai.map((value) {
                                          return DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _listNilai[index]?.nilai = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }) ??
                            [
                              Container(
                                child: Text("No data"),
                              )
                            ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nilai {
  int id;
  String nilai;
  Nilai({this.id, this.nilai});
}
