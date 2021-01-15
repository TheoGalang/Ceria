class Assigments {
  bool success;
  List<Data> data;

  Assigments({this.success, this.data});

  Assigments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  bool isDue;
  bool isSubmitted;
  String collectionDate;
  bool isLate;
  int grade;
  String description;
  String dateCreated;
  String dueDate;
  String userUpdate;
  String dateUpdate;
  String idTeacher;
  int isVisible;

  Data({
    this.id,
    this.title,
    this.dueDate,
    this.isDue,
    this.isSubmitted,
    this.collectionDate,
    this.isLate,
    this.grade,
    this.description,
    this.dateCreated,
    this.userUpdate,
    this.dateUpdate,
    this.idTeacher,
    this.isVisible,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDue = json['isDue'];
    isSubmitted = json['isSubmitted'];
    collectionDate = json['collection_date'] ?? "";
    isLate = json['isLate'];
    grade = json['grade'] ?? 0;

    description = json['description'];
    dateCreated = json['date_created'];
    dueDate = json['due_date'];
    userUpdate = json['user_update'];
    dateUpdate = json['date_update'];
    idTeacher = json['id_teacher'];
    isVisible = json['isVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['isDue'] = this.isDue;
    data['isSubmitted'] = this.isSubmitted;
    data['collection_date'] = this.collectionDate;
    data['isLate'] = this.isLate;
    data['grade'] = this.grade;

    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    data['due_date'] = this.dueDate;
    data['user_update'] = this.userUpdate;
    data['date_update'] = this.dateUpdate;
    data['id_teacher'] = this.idTeacher;
    data['isVisible'] = this.isVisible;
    return data;
  }
}
