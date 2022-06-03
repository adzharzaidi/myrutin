import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/screen/widgets/projects/add_project_task_dialog.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:myrutin/screen/widgets/projects/edit_project_task.dart';
import '../../../provider/project_task_provider.dart';
import '../../../utils/show_snack_bar.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectTask projectTask;
  const ProjectWidget({Key? key, required this.projectTask}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        EditProjectTaskDialog(projectTask: projectTask)),
                backgroundColor: COLOR_PURPLE,
                icon: Icons.edit,
                foregroundColor: COLOR_WHITE,
                label: 'Edit',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => deleteProjectTask(context, projectTask),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                foregroundColor: COLOR_WHITE,
                label: 'Delete',
              )
            ],
          ),
          key: Key(projectTask.id),
          child: buildProjectTask(context),
        ),
      );

  Widget buildProjectTask(BuildContext context) => Container(
        color: COLOR_WHITE,
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Checkbox(
              activeColor: COLOR_BLUE,
              checkColor: COLOR_WHITE,
              value: projectTask.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<ProjectTaskProvider>(context, listen: false);
                final isDone = provider.toggleProjectTask(projectTask);

                Utils.showSnackBar(
                    context, isDone ? 'Task completed' : 'Task incomplete');
              },
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
                    color: COLOR_BLACK,
                    fontSize: 22,
                  ),
                ),
                if (projectTask.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      projectTask.description,
                      style: TextStyle(
                          fontSize: 20, color: COLOR_GREY, height: 1.5),
                    ),
                  )
              ],
            ))
          ],
        ),
      );
  void deleteProjectTask(BuildContext context, ProjectTask projectTask) {
    final provider = Provider.of<ProjectTaskProvider>(context, listen: false);
    provider.removeProjectTask(projectTask);

    Utils.showSnackBar(context, 'Task Deleted');
  }

  void editProjectTask(BuildContext context, ProjectTask projectTask) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditProjectTaskDialog(projectTask: projectTask),
        ),
      );
}
