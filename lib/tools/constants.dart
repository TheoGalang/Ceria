import 'package:ceria/views/screen_guru/tugas/models/kelas_model.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/material.dart';

final List<Assignment> constAssingments = [
  Assignment(
    title: "Tugas Bagasa Indonesia",
    description: "Tulis sebuah cerita pendek",
    deadline: DateTime.now().add(Duration(days: 7)),
    attachmentFile: null,
  ),
  Assignment(
    title: "Tugas Matematika",
    description: "Kerjakan latihan halaman 20",
    deadline: DateTime.now().add(Duration(days: 6)),
    attachmentFile: null,
  ),
  Assignment(
    title: "Tugas Keterampilan",
    description: "Buatlah karya keterampilan dari barang bekas",
    deadline: DateTime.now().add(Duration(days: 5)),
    attachmentFile: null,
  ),
  Assignment(
    title: "Tugas Pendidikan Pancasila",
    description: "Kerjakan latihan halaman 21",
    deadline: DateTime.now().add(Duration(days: 4)),
    attachmentFile: null,
  ),
  Assignment(
    title: "Tugas Penjaskes",
    description: "Buat gambar lapangan voli",
    deadline: DateTime.now().add(Duration(days: 3)),
    attachmentFile: null,
  ),
];

// final List<Kelas> constKelas = [
//   Kelas(
//     namaKelas: "Kelas 12 IPA 1",
//     assignments: [],
//   ),
//   Kelas(
//     namaKelas: "Kelas 12 IPA 2",
//     assignments: constAssingments,
//   ),
//   Kelas(
//     namaKelas: "Kelas 12 IPA 3",
//     assignments: constAssingments,
//   ),
//   Kelas(
//     namaKelas: "Kelas 12 IPS 1",
//     assignments: constAssingments,
//   ),
//   Kelas(
//     namaKelas: "Kelas 12 IPS 2",
//     assignments: constAssingments,
//   ),
// ];

// custome color
final color = MaterialColor(
  0xFF41348C,
  const <int, Color>{
    50: const Color(0xFF41348C),
    100: const Color(0xFF41348C),
    200: const Color(0xFF41348C),
    300: const Color(0xFF41348C),
    400: const Color(0xFF41348C),
    500: const Color(0xFF41348C),
    600: const Color(0xFF41348C),
    700: const Color(0xFF41348C),
    800: const Color(0xFF41348C),
    900: const Color(0xFF41348C),
  },
);

var child;

Size size = Size.zero;
double vh, vw = 0;
Orientation orientation = Orientation.portrait;

void initSize(BuildContext context) {
  MediaQueryData media = MediaQuery.of(context);
  orientation = media.orientation;
  size = media.size;
  vh = size.height > size.width ? size.height / 100 : size.width / 100;
  vw = size.height < size.width ? size.height / 100 : size.width / 100;
}
