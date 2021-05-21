class NilaiRaport {
  bool success;
  String message;
  List<Data> data;

  NilaiRaport({this.success, this.message, this.data});

  NilaiRaport.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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
  String nilai;
  String dateCreated;
  String nis;
  int idTema;
  int idSubtema;
  int idIndicator;

  Data(
      {this.id,
      this.nilai,
      this.dateCreated,
      this.nis,
      this.idTema,
      this.idSubtema,
      this.idIndicator});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nilai = json['nilai'];
    dateCreated = json['date_created'];
    nis = json['nis'];
    idTema = json['id_tema'];
    idSubtema = json['id_subtema'];
    idIndicator = json['id_indicator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nilai'] = this.nilai;
    data['date_created'] = this.dateCreated;
    data['nis'] = this.nis;
    data['id_tema'] = this.idTema;
    data['id_subtema'] = this.idSubtema;
    data['id_indicator'] = this.idIndicator;
    return data;
  }
}
