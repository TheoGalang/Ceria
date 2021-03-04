class TeachersCreateAssigment {
  bool success;
  String message;
  Data data;

  TeachersCreateAssigment({this.success, this.message, this.data});

  TeachersCreateAssigment.fromJson(Map<String, dynamic> json) {
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
  String title;
  String description;
  String dateCreated;
  String dueDate;
  Null userUpdate;
  Null dateUpdate;
  String idTeacher;
  Null isVisible;
  int id;

  Data(
      {this.title,
      this.description,
      this.dateCreated,
      this.dueDate,
      this.userUpdate,
      this.dateUpdate,
      this.idTeacher,
      this.isVisible,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    dateCreated = json['date_created'];
    dueDate = json['due_date'];
    userUpdate = json['user_update'];
    dateUpdate = json['date_update'];
    idTeacher = json['id_teacher'];
    isVisible = json['isVisible'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    data['due_date'] = this.dueDate;
    data['user_update'] = this.userUpdate;
    data['date_update'] = this.dateUpdate;
    data['id_teacher'] = this.idTeacher;
    data['isVisible'] = this.isVisible;
    data['id'] = this.id;
    return data;
  }
}
