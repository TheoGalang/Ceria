import 'package:ceria/tools/theme.dart';
import 'package:ceria/views/screen_parent/raport/viewModel/parent_raport_nilai_viewModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../generalPage.dart';
import 'package:flutter/material.dart';

class ListNilaiStudentRaportParent extends StatefulWidget {
  final String name;
  final String date;
  final String nis;

  const ListNilaiStudentRaportParent({Key key, this.name, this.date, this.nis})
      : super(key: key);
  @override
  _ListNilaiStudentRaportState createState() => _ListNilaiStudentRaportState();
}

class _ListNilaiStudentRaportState extends State<ListNilaiStudentRaportParent> {
  bool _visible = false;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParentRaportShowViewModel>.reactive(
      viewModelBuilder: () => ParentRaportShowViewModel(
        date: widget.date,
        nis: widget.nis,
      ),
      onModelReady: (model) async {
        await model.initial();
      },
      builder: (_, model, __) => GeneralPage(
        judul: widget.name ?? "Nama",
        subJudul1: widget.nis ?? 'nis',
        subJudul2: widget.date == null
            ? 'hari, tanggal bulan tahun'
            : DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .format(DateTime.parse(widget.date ?? DateTime.now()))
                .toString(),
        child: Container(
          margin: EdgeInsets.only(top: 16),
          height: MediaQuery.of(context).size.height * 4 / 5,
          child: model.isBusy
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: mainColor,
                    ),
                    Text(
                      "Sedang mengambil nilai...",
                      style: TextStyle(color: mainColor),
                    )
                  ],
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model?.nilai?.data?.length ?? 0,
                  itemBuilder: (BuildContext buildContext, index) {
                    var element = model.nilai.data[index];
                    return Container(
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
                              child: Text(element.indicator,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              element.nilai,
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
