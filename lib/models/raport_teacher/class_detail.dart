class ClassDetail {
  bool success;
  String message;
  Data data;
  List<Students> students = [];

  ClassDetail({this.success, this.message, this.data, this.students});

  ClassDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['students'] != null) {
      students = new List<Students>();
      json['students'].forEach((v) {
        students.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.students != null) {
      data['students'] = this.students.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String kelas;
  int thnAkademik;
  int status;
  String nomorPegawai;
  String foto;
  String deskripsi;

  Data(
      {this.id,
      this.kelas,
      this.thnAkademik,
      this.status,
      this.nomorPegawai,
      this.foto,
      this.deskripsi});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kelas = json['kelas'];
    thnAkademik = json['thn_akademik'];
    status = json['status'];
    nomorPegawai = json['nomor_pegawai'];
    foto = json['foto'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kelas'] = this.kelas;
    data['thn_akademik'] = this.thnAkademik;
    data['status'] = this.status;
    data['nomor_pegawai'] = this.nomorPegawai;
    data['foto'] = this.foto;
    data['deskripsi'] = this.deskripsi;
    return data;
  }
}

class Students {
  String nomorInduk;
  String nikParent;
  int idKelas;
  String nama;

  Students({this.nomorInduk, this.nikParent, this.idKelas, this.nama});

  Students.fromJson(Map<String, dynamic> json) {
    nomorInduk = json['nomor_induk'];
    nikParent = json['nik_parent'];
    idKelas = json['id_kelas'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor_induk'] = this.nomorInduk;
    data['nik_parent'] = this.nikParent;
    data['id_kelas'] = this.idKelas;
    data['nama'] = this.nama;
    return data;
  }
}
