import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/delete_project_dialog.dart';
import 'package:provider/provider.dart';
import '../../add_project_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/screen/project_details.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:myrutin/provider/project_provider.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  // final projectList = Project.generateProject();

  Map taskByProject = {};
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<ProjectTaskProvider>(context);
    final projectTask = taskProvider.projectTaskAll;

    taskByProject = {};
    for (var task in projectTask) {
      if (taskByProject[task.project] == null) {
        taskByProject[task.project] = [];
      }
      taskByProject[task.project].add(task);
    }

    final provider = Provider.of<ProjectProvider>(context);
    final project = provider.project;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.builder(
          itemCount: project.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildProject(context, project[index])),
    );
  }

  Widget _buildAddProject() {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => new AddProject()),
      child: DottedBorder(
        padding: EdgeInsets.all(25),
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: COLOR_GREY,
        strokeWidth: 2,
        child: Center(
          child: Text(
            '+ Add new project',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) {
    Map taskByStatus = {};

    if (taskByProject[project.id] != null) {
      for (var task in taskByProject[project.id]) {
        if (taskByStatus[task.isDone] == null) {
          taskByStatus[task.isDone] = [];
        }
        taskByStatus[task.isDone].add(task);
      }
    }

    var numberOfUncompletedTask = taskByStatus[false]?.length;
    var numberOfCompletedTask = taskByStatus[true]?.length;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProjectDetails(
                  project: project.id,
                )));
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => DeleteProject(project: project));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Icon(Icons.cases_outlined, color: COLOR_PURPLE, size: 35),
            ),
            SizedBox(
              height: 30,
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    numberOfUncompletedTask == null
                        ? _buildProjectStatus(
                            COLOR_BLUE, COLOR_PURPLE, '0 task left!')
                        : _buildProjectStatus(COLOR_BLUE, COLOR_PURPLE,
                            '$numberOfUncompletedTask tasks left!'),
                    SizedBox(width: 5),
                    numberOfCompletedTask == null
                        ? _buildProjectStatus(
                            COLOR_LIGHTBLUE, COLOR_PURPLE, 'No tasks done!')
                        : _buildProjectStatus(COLOR_LIGHTBLUE, COLOR_PURPLE,
                            '$numberOfCompletedTask tasks done!')
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectStatus(Color bgColor, Color textColor, String text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: COLOR_PURPLE, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(
                color: COLOR_WHITE,
                fontSize: 15,
                fontWeight: FontWeight.bold)));
  }
}
