import 'viewModel/teacher_choose_history_viewModel.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

import 'teacher_add_nilai.dart';
import 'teacher_rapot_nilai.dart';

class ChooseHistoryTeacherRaport extends StatelessWidget {
  final String namaSiswa;
  final String nis;

  ChooseHistoryTeacherRaport({
    Key key,
    this.namaSiswa,
    this.nis,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherChooseHistoryViewModel>.reactive(
      viewModelBuilder: () => TeacherChooseHistoryViewModel(nis: this.nis),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => GeneralPage(
        judul: 'History Raport',
        subJudul1: namaSiswa ?? 'Nama Siswa',
        floatingActionButton: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TeacherRaportAddNilai(
                          namaSiswa: namaSiswa,
                          nis: nis,
                        ))).then((value) async {
              await model.initial();
            });
          },
          color: Color(0xff41348C),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Isi Nilai baru",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: List.generate(
              model?.history?.data?.length ?? 0,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // go to view nilai page
                          builder: (_) => TeacherRaportViewNilai(
                                name: this.namaSiswa,
                                date:
                                    model?.history?.data[index]?.dateCreated ??
                                        '',
                                nis: nis,
                              )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  margin: EdgeInsets.only(bottom: 16),
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
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                          DateFormat("EEEE, d MMMM yyyy", "id_ID").format(
                              DateTime.parse(
                                  model.history.data[index].dateCreated)),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
