class Kelas {
  bool success;
  String message;
  DataKelas data;

  Kelas({this.success, this.message, this.data});

  Kelas.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataKelas.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataKelas {
  int id;
  String kelas;
  int thnAkademik;
  int status;
  String nomorPegawai;

  DataKelas(
      {this.id, this.kelas, this.thnAkademik, this.status, this.nomorPegawai});

  DataKelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kelas = json['kelas'];
    thnAkademik = json['thn_akademik'];
    status = json['status'];
    nomorPegawai = json['nomor_pegawai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kelas'] = this.kelas;
    data['thn_akademik'] = this.thnAkademik;
    data['status'] = this.status;
    data['nomor_pegawai'] = this.nomorPegawai;
    return data;
  }
}
