class SubTema {
  bool success;
  String message;
  List<Data> data;

  SubTema({this.success, this.message, this.data});

  SubTema.fromJson(Map<String, dynamic> json) {
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
  String title;
  int idTema;

  Data({this.id, this.title, this.idTema});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    idTema = json['id_tema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['id_tema'] = this.idTema;
    return data;
  }
}
