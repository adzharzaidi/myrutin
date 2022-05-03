import 'package:flutter/material.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectField {
  static const createdTime = 'createdTime';
}

class Project {
  String id;
  DateTime createdTime;
  // IconData? iconData;
  String? title;
  // Color? bgColor;
  // Color? iconColor;
  // Color? btnColor;
  num? left;
  num? done;
  bool isLast;

  Project(
      {required this.id,
      required this.createdTime,
      // this.iconData,
      this.title,
      // this.bgColor,
      // this.iconColor,
      // this.btnColor,
      this.done,
      this.left,
      this.isLast = false});
  // static List<Project> generateProject() {
  //   return [
  //     Project(
  //       iconData: Icons.cases_outlined,
  //       title: 'Project 1',
  //       bgColor: COLOR_PURPLE,
  //       iconColor: COLOR_PURPLE,
  //       btnColor: COLOR_BLUE,
  //       left: 3,
  //       done: 1,
  //     ),
  //     Project(isLast: true)
  //   ];
  // }
}
