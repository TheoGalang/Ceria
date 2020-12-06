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
  String dueDate;
  bool isDue;
  bool isSubmitted;
  String collectionDate;
  bool isLate;
  int grade;

  Data(
      {this.id,
      this.title,
      this.dueDate,
      this.isDue,
      this.isSubmitted,
      this.collectionDate,
      this.isLate,
      this.grade});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dueDate = json['due_date'];
    isDue = json['isDue'];
    isSubmitted = json['isSubmitted'];
    collectionDate = json['collection_date'];
    isLate = json['isLate'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['due_date'] = this.dueDate;
    data['isDue'] = this.isDue;
    data['isSubmitted'] = this.isSubmitted;
    data['collection_date'] = this.collectionDate;
    data['isLate'] = this.isLate;
    data['grade'] = this.grade;
    return data;
  }
}
