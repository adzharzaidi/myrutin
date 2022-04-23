import 'package:flutter/cupertino.dart';

class ProjectTaskField {
  static const createdTime = 'createdTime';
}

class ProjectTask {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  ProjectTask({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
}
