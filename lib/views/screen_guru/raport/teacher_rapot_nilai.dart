import 'package:intl/intl.dart';

import '../../../models/raport_teacher/nilai_raport.dart';
import '../../../models/raport_teacher/sub_tema.dart';
import '../../../models/raport_teacher/tema.dart';
import 'viewModel/teacher_raport_view_nilai_viewModel.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

class TeacherRaportViewNilai extends StatefulWidget {
  final String name;
  final String date;
  final String nis;

  const TeacherRaportViewNilai({Key key, this.name, this.date, this.nis})
      : super(key: key);
  @override
  _TeacherRaportViewNilaiState createState() => _TeacherRaportViewNilaiState();
}

class _TeacherRaportViewNilaiState extends State<TeacherRaportViewNilai> {
  bool _visible = false;
  List<Widget> viewNilai = [];

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  initiateView(Tema temas, SubTema subTema, NilaiRaport nilai,
      TeacherRaportViewNilaiViewModel model) async {
    for (var tema in temas?.data ?? []) {
      for (var sub
          in subTema.data.where((element) => element.idTema == tema.id)) {
        var corelatedValue = nilai.data.where((element) =>
            element.idTema == tema.id && element.idSubtema == sub.id);

        // get indikator
        await model.getIndikator(idTema: tema.id, idSubTema: sub.id);

        Widget bar = Container();

        if (corelatedValue.length != 0) {
          bar = GestureDetector(
            onTap: _toggle,
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
              child: Text("${tema.title}/${sub.title}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold)),
            ),
          );
        }
        Widget labelNilai = Container(
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
        );

        List<Widget> viewNilaiPerIndikator = [];

        for (var value in corelatedValue) {
          viewNilaiPerIndikator.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Expanded(
                  // texk indikator
                  child: Text(
                      model.indikator.data
                          .where((element) => element.id == value.idIndicator)
                          .first
                          .description,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Text("${value.nilai}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ],
          ));
        }

        viewNilai.add(bar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherRaportViewNilaiViewModel>.reactive(
      viewModelBuilder: () => TeacherRaportViewNilaiViewModel(
        date: widget.date,
        nis: widget.nis,
      ),
      onModelReady: (model) async {
        await model.initial();
        initiateView(model.tema, model.subTema, model.nilai, model);
      },
      builder: (_, model, __) => GeneralPage(
        judul: "Rapot Siswa",
        subJudul1: widget.name,
        subJudul2: DateFormat("EEEE, d MMMM yyyy", "id_ID")
            .format(DateTime.parse(widget.date ?? DateTime.now()))
            .toString(),
        child: Column(
          children: viewNilai ??
              [] +
                  [
                    GestureDetector(
                      onTap: _toggle,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        child: Text("Diri Sendiri / Identitas",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            child: Container(
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
                                children: [
                                  Container(
                                    child: Expanded(
                                      child: Text(
                                          "Anak mampu mengucapkan kalimat Syahadat ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                  Text("BB",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
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
