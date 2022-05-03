import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _project = [
    Project(createdTime: DateTime.now(), title: 'project 1', id: '1'),
    Project(createdTime: DateTime.now(), title: 'project 2', id: '2'),
    Project(createdTime: DateTime.now(), title: 'project 1', id: '4'),
  ];

  List<Project> get project =>
      _project.where((project) => project.isLast == false).toList();

  void generateProject(Project project) {
    _project.add(project);
    notifyListeners();
  }
}
