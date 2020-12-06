import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';

class Kelas {
  String namaKelas;
  int jumlahTugas;
  List<Assignment> assignments = [];

  Kelas({this.namaKelas, this.assignments}) {
    this.jumlahTugas = assignments.length;
  }
}
