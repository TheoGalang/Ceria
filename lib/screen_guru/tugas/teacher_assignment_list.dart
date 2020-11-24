import 'package:ceria/screen_guru/teacher_presence_chooseclass.dart';
import 'package:ceria/screen_guru/tugas/models/kelas_model.dart';
import 'package:ceria/screen_guru/tugas/teacher_assignment_chooseclass.dart';
import 'package:ceria/screen_guru/tugas/widgets/view_assignment_teacher.dart';
import 'package:ceria/screen_guru/tugas/teacher_assignment_add.dart';
import 'package:ceria/screen_parent/tugas/widgets/Assignment.dart';
import 'package:ceria/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowAssignment extends StatefulWidget {
  final Kelas kelas;
  final int id;

  ShowAssignment({this.kelas, this.id});
  @override
  _ShowAssignmentState createState() => _ShowAssignmentState();
}

class _ShowAssignmentState extends State<ShowAssignment> {
  final List<TeacherSimpleAssignmentView> assingmentNotDoneYet = [];

  void loadAssignment() {
    List<TeacherSimpleAssignmentView> temp = [];
    List<Assignment> assigments = widget.kelas.assignments ?? constAssingments;

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
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            buildSimpleHeader(context),
            assignments(data: assingmentNotDoneYet, aspek: "BELUM SELESAI"),
            buildButtonNewAssignment(),
          ],
        ),
      ),
    );
  }

  Container buildButtonNewAssignment() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => AddAssignmentTugas(id: widget.id),
            ),
          );
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

  Flexible assignments({List<TeacherSimpleAssignmentView> data, String aspek}) {
    return Flexible(
      child: data.length != 0
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
                "${widget.kelas.namaKelas}",
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
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      ChooseClassTeacherTugas(listKelas: constKelas)));
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
