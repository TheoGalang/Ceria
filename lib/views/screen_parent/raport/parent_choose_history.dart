import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

import 'parent_rapot_nilai.dart';
import 'viewModel/parent_choose_history_viewModel.dart';

class ChooseHistoryParentRaport extends StatelessWidget {
  final String name;
  final String nis;
  ChooseHistoryParentRaport({this.nis, this.name});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParentChooseHistoryViewModel>.reactive(
      viewModelBuilder: () => ParentChooseHistoryViewModel(nis: this.nis),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => GeneralPage(
        judul: 'Rapot',
        subJudul1: this.name ?? "Nama",
        child: Container(
          margin: EdgeInsets.fromLTRB(40, 40, 40, 30),
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: (model?.history?.data?.length ?? 0) == 0
                ? [
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Expanded(
                              child: Text("Belum ada penilaian!",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
                : List.generate(
                    model?.history?.data?.length ?? 0,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // go to view nilai page
                                builder: (_) => ListNilaiStudentRaportParent(
                                    name: name,
                                    date: model?.history?.data[index]
                                            ?.dateCreated ??
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
