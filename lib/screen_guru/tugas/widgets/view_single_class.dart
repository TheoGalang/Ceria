import 'package:ceria/screen_guru/tugas/teacher_assignment_list.dart';
import 'package:ceria/screen_guru/tugas/models/kelas_model.dart';
import 'package:flutter/material.dart';

class SingleClassView extends StatelessWidget {
  final Kelas kelas;
  final int id;

  SingleClassView({this.kelas, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ShowAssignment(kelas: this.kelas, id: this.id);
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
                child: Text("${kelas.namaKelas}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff41348C),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Text("${kelas.jumlahTugas} Tugas Aktif",
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
