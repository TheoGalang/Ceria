class Child {
  bool success;
  String message;
  Data data;

  Child({this.success, this.message, this.data});

  Child.fromJson(Map<String, dynamic> json) {
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
  String nomorInduk;
  String nikParent;
  int idKelas;
  String nama;

  Data({this.nomorInduk, this.nikParent, this.idKelas, this.nama});

  Data.fromJson(Map<String, dynamic> json) {
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
