import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/screen/add_project_dialog.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _project = [
    Project(
      createdTime: DateTime.now(),
      title: 'project 1',
      id: '1',
      left: 1,
      done: 1,
    ),
  ];

  List<Project> get project => _project;

  void generateProject(Project project) {
    _project.add(project);
    notifyListeners();
  }
}
