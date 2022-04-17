import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/screen/project_details.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';

class Projects extends StatelessWidget {
  final projectsList = Project.generateProject();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.builder(
          itemCount: projectsList.length,
          itemBuilder: (BuildContext context, int index) =>
              projectsList[index].isLast
                  ? _buildAddProject()
                  : _buildProject(context, projectsList[index])),
    );
  }

  Widget _buildAddProject() {
    return DottedBorder(
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
        ));
  }

  Widget _buildProject(BuildContext context, Project project) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProjectDetails(project)));
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
              child: Icon(project.iconData, color: project.iconColor, size: 35),
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
                    _buildProjectStatus(project.btnColor!, project.iconColor!,
                        '${project.left} tasks left!'),
                    SizedBox(width: 5),
                    _buildProjectStatus(COLOR_LIGHTBLUE, project.iconColor!,
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
            color: bgColor, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(
                color: COLOR_WHITE,
                fontSize: 15,
                fontWeight: FontWeight.bold)));
  }
}
