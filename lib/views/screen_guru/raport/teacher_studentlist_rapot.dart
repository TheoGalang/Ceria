import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

import 'teacher_choose_history.dart';
import 'viewModel/teacher_raport_choose_student_viewModel.dart';

class TeacherRaportListStudent extends StatelessWidget {
  final String kelas;
  final int idKelas;

  const TeacherRaportListStudent({Key key, this.kelas, this.idKelas})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherRaportChooseStudentViewModel>.reactive(
      viewModelBuilder: () =>
          TeacherRaportChooseStudentViewModel(idKelas: idKelas),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => GeneralPage(
        judul: "Daftar Siswa",
        subJudul1: kelas ?? '',
        floatingActionButton: null,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                      child: Text("No Absen",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.bold)),
                    ),
                    Text("Nama Siswa",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff41348C),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                  children: (model?.classDetail?.students?.length ?? 0) >= 0
                      ? List.generate(
                          model?.classDetail?.students?.length ?? 0,
                          (index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ChooseHistoryTeacherRaport(
                                            namaSiswa: model?.classDetail
                                                    ?.students[index]?.nama ??
                                                '',
                                          )));
                            },
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
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(35, 0, 25, 0),
                                    child: Text(
                                        model.classDetail.students[index]
                                            .nomorInduk,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  Text(model.classDetail.students[index].nama,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                        )
                      : [
                          Container(
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
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(35, 0, 25, 0),
                                  child: Text("105217040",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Text("Theo Galang Saputra",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ]),
            ],
          ),
        ),
      ),
    );
  }
}
