import 'package:ceria/views/screen_guru/raport/teacher_studentlist_rapot.dart';
import 'package:ceria/views/screen_guru/raport/viewModel/teacher_raport_choose_class_viewModel.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

class TeacherRaphortChooseClass extends StatelessWidget {
  final String nip;

  const TeacherRaphortChooseClass({Key key, this.nip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherRaportChooseClassViewModel>.reactive(
      viewModelBuilder: () => TeacherRaportChooseClassViewModel(nip: this.nip),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => GeneralPage(
        judul: 'Pilih Kelas',
        subJudul1: '',
        child: Container(
          margin: EdgeInsets.only(top: 16),
          // padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (model?.kelas?.data?.length ?? 0) <= 0
                ? [Container()]
                : List.generate(
                    model?.kelas?.data?.length ?? 0,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TeacherRaportListStudent(
                                kelas: model.kelas.data[index].kelas,
                                idKelas: model.kelas.data[index].id,
                              ),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                        width: double.infinity,
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
                          child: Text(model.kelas.data[index].kelas,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ).toList(),
          ),
        ),
      ),
    );
  }
}
