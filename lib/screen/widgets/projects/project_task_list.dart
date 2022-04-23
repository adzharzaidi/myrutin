import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/screen/widgets/projects/project_widget.dart';

class ProjectTaskList extends StatelessWidget {
  const ProjectTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectWidget(
        projectTask:
            ProjectTask(createdTime: DateTime.now(), title: 'test', id: ''));
  }
}
