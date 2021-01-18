import 'package:ceria/providers/teacher/teacher_assignment_detail%20_viewModel.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailTugasTeacher extends StatelessWidget {
  final Assignment assignment;
  final int classId;
  final String namaKelas;

  DetailTugasTeacher({this.assignment, this.classId, this.namaKelas});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherAssignmentDetailViewModel>.reactive(
      viewModelBuilder: () =>
          TeacherAssignmentDetailViewModel(assignment: this.assignment),
      onModelReady: (model) {
        model.initial(context: context);
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${this.assignment.title}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff41348C),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.circle,
                              color: Color(0xff41348C),
                              size: 15,
                            ),
                          ),
                          Text(
                            "Kelas ${this.namaKelas}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.circle,
                              color: Color(0xff41348C),
                              size: 15,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "${this.assignment.description}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Pengumpulan",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(children: model?.listPengumpulan ?? []),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Detail Tugas"),
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
