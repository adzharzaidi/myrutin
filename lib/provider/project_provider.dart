import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/screen/add_project_dialog.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _project = [
    // Project(
    //   createdTime: DateTime.now(),
    //   title: 'Project 1',
    //   id: '1',
    // ),
  ];

  List<Project> get project => _project;

  List<Project> getTitle(String title) {
    return _project;
  }

  void generateProject(Project project) {
    _project.add(project);
    notifyListeners();
  }

  void removeProject(Project project) {
    _project.remove(project);
    notifyListeners();
  }

  void updateProject(Project project, String title) {
    project.title = title;

    notifyListeners();
  }
}
