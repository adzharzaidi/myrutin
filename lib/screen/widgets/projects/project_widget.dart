import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectTask projectTask;
  const ProjectWidget({Key? key, required this.projectTask}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Checkbox(
            activeColor: COLOR_BLUE,
            checkColor: COLOR_WHITE,
            value: projectTask.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectTask.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: COLOR_PURPLE,
                  fontSize: 22,
                ),
              ),
              if (projectTask.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    projectTask.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ))
        ],
      );
}
