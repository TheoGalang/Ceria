import 'package:ceria/screen_guru/tugas/models/kelas_model.dart';
import 'package:ceria/screen_parent/tugas/widgets/Assignment.dart';

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

final List<Kelas> constKelas = [
  Kelas(
    namaKelas: "Kelas 12 IPA 1",
    assignments: [],
  ),
  Kelas(
    namaKelas: "Kelas 12 IPA 2",
    assignments: constAssingments,
  ),
  Kelas(
    namaKelas: "Kelas 12 IPA 3",
    assignments: constAssingments,
  ),
  Kelas(
    namaKelas: "Kelas 12 IPS 1",
    assignments: constAssingments,
  ),
  Kelas(
    namaKelas: "Kelas 12 IPS 2",
    assignments: constAssingments,
  ),
];
