class Indicators {
  bool success;
  String message;
  List<Data> data;

  Indicators({this.success, this.message, this.data});

  Indicators.fromJson(Map<String, dynamic> json) {
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
  String description;
  int idTema;
  int idSubtema;

  Data({this.id, this.description, this.idTema, this.idSubtema});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    idTema = json['id_tema'];
    idSubtema = json['id_subtema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['id_tema'] = this.idTema;
    data['id_subtema'] = this.idSubtema;
    return data;
  }
}
