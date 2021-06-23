class Kelas {
  bool success;
  String message;
  List<Data> data = [];

  Kelas({this.success, this.message, this.data});

  Kelas.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
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
    foto = json['foto'] ?? "";
    deskripsi = json['deskripsi'] ?? "";
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
