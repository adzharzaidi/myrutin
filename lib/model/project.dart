import 'package:flutter/material.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectField {
  static const createdTime = 'createdTime';
}

class Project {
  String id;
  DateTime createdTime;
  String? title;

  Project({
    required this.id,
    required this.createdTime,
    this.title,
  });
}
