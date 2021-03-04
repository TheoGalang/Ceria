import 'package:ceria/models/kelas.dart';
import 'package:ceria/providers/teacher/teacher_assignment_list_viewModel.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'teacher_assignment_add.dart';
import 'widgets/view_assignment_teacher.dart';
import 'package:supercharged/supercharged.dart';

class ShowAssignment extends StatefulWidget {
  final Kelas kelas;
  final int id;
  final String teachersID;

  ShowAssignment({this.kelas, this.id, this.teachersID});
  @override
  _ShowAssignmentState createState() => _ShowAssignmentState();
}

class _ShowAssignmentState extends State<ShowAssignment> {
  final List<TeacherSimpleAssignmentView> assingmentNotDoneYet = [];

  void loadAssignment() {
    List<TeacherSimpleAssignmentView> temp = [];
    List<Assignment> assigments = [];

    for (var item in assigments) {
      temp.insert(
          0,
          TeacherSimpleAssignmentView(
            classId: widget.id,
            assignment: item,
          ));
    }
    assingmentNotDoneYet.addAll(temp);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadAssignment();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherAssignmentListViewModel>.reactive(
      viewModelBuilder: () => TeacherAssignmentListViewModel(
        teachersID: widget.teachersID,
        kelas: widget.kelas,
      ),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildSimpleHeader(context),
              assignments(
                data: model?.assingmentNotDoneYet ?? [],
                aspek: "BELUM SELESAI",
                model: model,
              ),
              buildButtonNewAssignment(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildButtonNewAssignment({TeacherAssignmentListViewModel model}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddAssignmentTugas(
                id: widget.id,
                idKelas: widget.kelas.data.id,
                idTeacher: widget.teachersID,
              ),
            ),
          ).then((_) {
            model = TeacherAssignmentListViewModel();
            model.initial();
            setState(() {});
          });
        },
        child: Text(
          "Tambah Tugas",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Color(0xFF41348C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Flexible assignments(
      {List<TeacherSimpleAssignmentView> data,
      String aspek,
      TeacherAssignmentListViewModel model}) {
    return Flexible(
      child: model.isBusy
          ? SpinKitCircle(color: "41348C".toColor())
          : data.length != 0
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  itemBuilder: (_, index) => data[index],
                  itemCount: data.length)
              : Container(
                  child: Center(
                    child: Text("Tidak ada tugas."),
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
          bottomRight: Radius.circular(50),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "List Tugas",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "${widget.kelas.data.kelas}",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
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
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) =>
          //             ChooseClassTeacherTugas(listKelas: constKelas),),);

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
