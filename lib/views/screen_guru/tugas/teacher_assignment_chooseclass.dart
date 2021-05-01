import '../../../models/kelas.dart';
import '../../../providers/teacher/teacher_assignment_chooseclass_viewModel.dart';
import 'teacher_assignment_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'widgets/view_single_class.dart';
import 'package:supercharged/supercharged.dart';

class ChooseClassTeacherTugas extends StatefulWidget {
  final List<Kelas> listKelas;
  final String teachersID;

  const ChooseClassTeacherTugas({this.listKelas, this.teachersID});
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
          TeacherAssignmentChooseClassViweModel(teachersID: widget.teachersID),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildSimpleHeader(context),
              kelasListTile(data: model?.listKelasView ?? [], model: model),
            ],
          ),
        ),
      ),
    );
  }

  Flexible kelasListTile(
      {List<SingleClassView> data,
      TeacherAssignmentChooseClassViweModel model}) {
    return Flexible(
      child: model.isBusy
          ? SpinKitCircle(
              color: "41348C".toColor(),
            )
          : data.length != 0
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ShowAssignment(
                                kelas: data[index].kelas,
                                id: data[index].id,
                                teachersID: data[index].kelas.data.nomorPegawai,
                              );
                            },
                          ),
                        ).then((value) {
                          model.initial();
                        });
                      },
                      child: data[index]),
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
