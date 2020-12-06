import 'package:ceria/models/assignments.dart';
import 'package:intl/intl.dart';

import '../parent_assignment_detail.dart';
import '../parent_assignment_score.dart';
import 'package:flutter/material.dart';

class SimpleAssignmentView extends StatelessWidget {
  final Data assignment;

  SimpleAssignmentView({this.assignment});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(assignment.dueDate);

    return GestureDetector(
      onTap: () {
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return this.assignment.isSubmitted
                    ? NilaiTugasParent(
                        assignment: this.assignment,
                      )
                    : DetailTugasParent(
                        assignment: this.assignment,
                      );
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
                  this.assignment.title,
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
                    DateFormat("EEEE, d MMMM yyyy", "id_ID").format(date),
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
