import 'package:provider/provider.dart';

import '../../add_project_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/screen/project_details.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:myrutin/provider/project_provider.dart';

class Projects extends StatefulWidget {
  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  // final projectsList = Project.generateProject();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProjectProvider>(context);
    final project = provider.project;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.builder(
          itemCount: project.length,
          itemBuilder: (BuildContext context, int index) =>
              project[index].isLast
                  ? _buildAddProject()
                  : _buildProject(context, project[index])),
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
            )));
  }

  Widget _buildProject(BuildContext context, Project project) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProjectDetails()));
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
                    _buildProjectStatus(COLOR_BLUE, COLOR_PURPLE,
                        '${project.left} tasks left!'),
                    SizedBox(width: 5),
                    _buildProjectStatus(COLOR_LIGHTBLUE, COLOR_PURPLE,
                        '${project.done} tasks done!')
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
