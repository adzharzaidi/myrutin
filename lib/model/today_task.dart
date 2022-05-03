import 'package:flutter/cupertino.dart';

class TodayTaskField {
  static const createdTime = 'createdTime';
}

class TodayTask {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  TodayTask({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
}
