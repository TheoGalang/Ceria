import 'package:ceria/screen_guru/tugas/detailtugas_teacher.dart';
import 'package:ceria/screen_guru/tugas/isinilai_teacher.dart';
import 'package:ceria/screen_guru/tugas/lampiran_teacher.dart';
import 'package:ceria/screen_guru/tugas/listtugas_guru.dart';
import 'package:ceria/screen_guru/tugas/pilihkelastugas_guru.dart';
import 'package:ceria/screen_guru/tugas/tambahtugas_guru.dart';
import 'package:ceria/screen_parent/daftarsiswa_parent.dart';
import 'package:ceria/screen_parent/home_parent.dart';
import 'package:ceria/screen_parent/tugas/detailtugas_parent.dart';
import 'package:ceria/screen_parent/tugas/listtugas_parent.dart';
import 'package:ceria/screen_parent/tugas/nilaitugas_parent.dart';
import 'package:ceria/screen_parent/tugas/pengumpulantugas_parent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ceria/screen_guru/home_guru.dart';
import 'package:ceria/screen_guru/pilihkelas_guru.dart';
import 'package:ceria/screen_guru/daftarsiswa_guru.dart';
import 'package:ceria/screen_parent/daftarsiswa_parent.dart';
import 'package:ceria/screen_guru/pilihkelasabsen_guru.dart';
import 'package:ceria/screen_guru/listkehadiran_guru.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NilaiTugasParent());
  }
}
