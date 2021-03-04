import 'package:ceria/models/kelas.dart';
// import 'package:ceria/views/screen_guru/tugas/models/kelas_model.dart';
import 'package:flutter/material.dart';

import '../teacher_assignment_list.dart';

class SingleClassView extends StatelessWidget {
  final Kelas kelas;
  final int id;
  final int assignmentsNumber;

  SingleClassView({this.kelas, this.id, this.assignmentsNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ShowAssignment(
                  kelas: this.kelas,
                  id: this.id,
                  teachersID: kelas.data.nomorPegawai,
                );
              },
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
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
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text("${kelas.data.kelas}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff41348C),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Text("${this.assignmentsNumber} Tugas Aktif",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
      ),
    );
  }
}
