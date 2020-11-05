import 'package:ceria/screen_guru/tugas/detailtugas_teacher.dart';
import 'package:ceria/screen_parent/tugas/widgets/Assignment.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TeacherSimpleAssignmentView extends StatelessWidget {
  final Assignment assignment;

  TeacherSimpleAssignmentView({this.assignment});

  @override
  Widget build(BuildContext context) {
    DateTime date = assignment.getDeadline();

    return GestureDetector(
      onTap: () {
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailTugasTeacher();
              },
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  this.assignment.getTitle(),
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Deadline " +
                    DateFormat("EEEE, d MMMM yyyy", "id_ID")
                        .format(assignment.deadline),
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff41348C),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
