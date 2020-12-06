class Parent {
  bool success;
  String message;
  Data data;

  Parent({this.success, this.message, this.data});

  Parent.fromJson(Map<String, dynamic> json) {
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
  String nik;
  String username;
  String nama;
  String role;

  Data({this.nik, this.username, this.nama, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    username = json['username'];
    nama = json['nama'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['username'] = this.username;
    data['nama'] = this.nama;
    data['role'] = this.role;
    return data;
  }
}
