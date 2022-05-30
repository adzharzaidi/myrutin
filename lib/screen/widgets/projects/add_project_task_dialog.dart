import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/widgets/projects/project_task_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProjectDialog extends StatefulWidget {
  final String project;

  ProjectDialog({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectDialog> createState() => _ProjectDialogState();
}

class _ProjectDialogState extends State<ProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 8),
              ProjectTaskFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedProjectTask: addProjectTask,
              ),
            ],
          ),
        ),
      );
  void addProjectTask() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      var uuid = Uuid();
      var v4 = uuid.v4();

      final projectTask = ProjectTask(
        id: v4,
        createdTime: DateTime.now(),
        title: title,
        description: description,
        project: widget.project,
      );
      final provider = Provider.of<ProjectTaskProvider>(context, listen: false);
      provider.addProjectTask(projectTask);
      Navigator.of(context).pop();
    }
  }
}
