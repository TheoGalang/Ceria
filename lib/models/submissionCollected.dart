class SubmissionCollected {
  bool success;
  String message;
  List<Data> data;

  SubmissionCollected({this.success, this.message, this.data});

  SubmissionCollected.fromJson(Map<String, dynamic> json) {
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
  String nama;
  String nis;
  String dateCreated;
  Null grade;
  List<File> file;

  Data({this.id, this.nama, this.nis, this.dateCreated, this.grade, this.file});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nis = json['nis'];
    dateCreated = json['date_created'];
    grade = json['grade'];
    if (json['file'] != null) {
      file = new List<File>();
      json['file'].forEach((v) {
        file.add(new File.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['nis'] = this.nis;
    data['date_created'] = this.dateCreated;
    data['grade'] = this.grade;
    if (this.file != null) {
      data['file'] = this.file.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class File {
  int id;
  String title;
  String location;
  String dateModified;
  Null userUpload;
  String type;
  Null idEvent;
  int idSubmission;
  Null idAssignment;

  File(
      {this.id,
      this.title,
      this.location,
      this.dateModified,
      this.userUpload,
      this.type,
      this.idEvent,
      this.idSubmission,
      this.idAssignment});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    dateModified = json['date_modified'];
    userUpload = json['user_upload'];
    type = json['type'];
    idEvent = json['id_event'];
    idSubmission = json['id_submission'];
    idAssignment = json['id_assignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    data['date_modified'] = this.dateModified;
    data['user_upload'] = this.userUpload;
    data['type'] = this.type;
    data['id_event'] = this.idEvent;
    data['id_submission'] = this.idSubmission;
    data['id_assignment'] = this.idAssignment;
    return data;
  }
}
