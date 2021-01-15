import 'package:ceria/models/kelas.dart';
import 'package:ceria/providers/teacher_assignment_chooseclass_viewModel.dart';
import 'package:ceria/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// import 'models/kelas_model.dart';
import 'widgets/view_single_class.dart';

class ChooseClassTeacherTugas extends StatefulWidget {
  final List<Kelas> listKelas;
  final String TeachersID;

  const ChooseClassTeacherTugas({this.listKelas, this.TeachersID});
  @override
  _ChooseClassTeacherTugasState createState() =>
      _ChooseClassTeacherTugasState();
}

class _ChooseClassTeacherTugasState extends State<ChooseClassTeacherTugas> {
  final List<SingleClassView> daftarKelas = [];

  void loadKelas() {
    List<SingleClassView> temp = [];
    List<Kelas> classes = widget.listKelas ?? [];

    for (var item in classes) {
      temp.insert(
          0,
          SingleClassView(
            kelas: item,
            id: classes.indexOf(item),
          ));
    }
    daftarKelas.addAll(temp);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadKelas();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherAssignmentChooseClassViweModel>.reactive(
      viewModelBuilder: () =>
          TeacherAssignmentChooseClassViweModel(teachersID: widget.TeachersID),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildSimpleHeader(context),
              kelasListTile(data: model?.listKelasView ?? []),
            ],
          ),
        ),
      ),
    );
  }

  Flexible kelasListTile({List<SingleClassView> data}) {
    return Flexible(
      child: data.length != 0
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 50),
              itemBuilder: (_, index) => data[index],
              itemCount: data.length)
          : Container(
              child: Center(
                child: Text("Tidak ada kelas."),
              ),
            ),
    );
  }

  Container buildSimpleHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFF41348c),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Pilih Kelas",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tugas",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF41348C),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
