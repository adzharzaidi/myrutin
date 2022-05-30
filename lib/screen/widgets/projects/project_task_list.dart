import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/widgets/projects/project_task_widget.dart';
import 'package:provider/provider.dart';

class ProjectTaskList extends StatelessWidget {
  final String project;

  const ProjectTaskList({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProjectTaskProvider>(context);
    final projectTask = provider.projectTask;

    var tasks = [];
    for (var task in projectTask) {
      if (task.project == project) {
        tasks.add(task);
      }
    }

    return projectTask.isEmpty
        ? const Center(
            child: Text(
              'There are no tasks',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final taskProject = tasks[index];
              return ProjectWidget(projectTask: taskProject);
            },
          );
  }
}
