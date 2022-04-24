import 'package:flutter/cupertino.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/screen/widgets/projects/project_task_completed.dart';

class ProjectTaskProvider extends ChangeNotifier {
  List<ProjectTask> _projectTask = [
    ProjectTask(
      createdTime: DateTime.now(),
      title: 'test',
      id: '1',
    ),
    ProjectTask(
      createdTime: DateTime.now(),
      title: 'test2',
      id: '2',
      description: 'this is a test desc',
    ),
  ];
  List<ProjectTask> get projectTask =>
      _projectTask.where((projectTask) => projectTask.isDone == false).toList();

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
}
