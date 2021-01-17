import 'dart:io';

class Assignment {
  final String title, description;
  final DateTime deadline;
  final int id;
  bool isComplete = false;
  File fileSubmition;
  int grade;
  List<File> attachmentFile;

  Assignment({
    this.id,
    this.title,
    this.description,
    this.deadline,
    this.attachmentFile,
  });

  String getTitle() => this.title;
  String getDescription() => this.description;
  DateTime getDeadline() => this.deadline;
  List getAttachmentFile() => this.attachmentFile;
}
