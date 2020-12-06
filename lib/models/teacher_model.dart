class Teacher {
  bool success;
  String message;
  Data data;

  Teacher({this.success, this.message, this.data});

  Teacher.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String nomorPegawai;
  String nama;
  String username;
  String role;

  Data({this.nomorPegawai, this.nama, this.username, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    nomorPegawai = json['nomor_pegawai'];
    nama = json['nama'];
    username = json['username'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor_pegawai'] = this.nomorPegawai;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['role'] = this.role;
    return data;
  }
}
