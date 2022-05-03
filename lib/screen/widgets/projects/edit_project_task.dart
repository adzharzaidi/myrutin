import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/widgets/projects/project_task_form_widget.dart';
import 'package:provider/provider.dart';

class EditProjectTaskDialog extends StatefulWidget {
  final ProjectTask projectTask;

  const EditProjectTaskDialog({Key? key, required this.projectTask})
      : super(key: key);

  @override
  State<EditProjectTaskDialog> createState() => _EditProjectTaskDialogState();
}

class _EditProjectTaskDialogState extends State<EditProjectTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.projectTask.title;
    description = widget.projectTask.description;
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 8),
              ProjectTaskFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedProjectTask: saveProjectTask,
              ),
            ],
          ),
        ),
      );

  void saveProjectTask() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<ProjectTaskProvider>(context, listen: false);
      provider.updateProjectTask(widget.projectTask, title, description);

      Navigator.of(context).pop();
    }
  }
}
