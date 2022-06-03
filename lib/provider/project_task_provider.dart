import 'package:flutter/cupertino.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/screen/widgets/projects/project_task_completed.dart';

class ProjectTaskProvider extends ChangeNotifier {
  List<ProjectTask> _projectTask = [
    // ProjectTask(
    //   createdTime: DateTime.now(),
    //   title: 'Project Task 1',
    //   id: '1',
    //   description: '',
    //   project: '2',
    // ),
    // ProjectTask(
    //   createdTime: DateTime.now(),
    //   title: 'Project Task 2',
    //   id: '2',
    //   description: 'Project Task 2 Description',
    //   project: '1',
    // ),
  ];
  List<ProjectTask> get projectTask =>
      _projectTask.where((projectTask) => projectTask.isDone == false).toList();

  List<ProjectTask> get projectTaskAll => _projectTask.toList();

  List<ProjectTask> get ProjectTaskCompleted =>
      _projectTask.where((projectTask) => projectTask.isDone == true).toList();

  void addProjectTask(ProjectTask projectTask) {
    _projectTask.add(projectTask);
    notifyListeners();
  }

  void removeProjectTask(ProjectTask projectTask) {
    _projectTask.remove(projectTask);
    notifyListeners();
  }

  bool toggleProjectTask(ProjectTask projectTask) {
    projectTask.isDone = !projectTask.isDone;
    return projectTask.isDone;
  }

  void updateProjectTask(
      ProjectTask projectTask, String title, String description) {
    projectTask.title = title;
    projectTask.description = description;

    notifyListeners();
  }
}
