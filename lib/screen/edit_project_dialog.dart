import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/provider/project_provider.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/add_project_form.dart';
import 'package:myrutin/screen/widgets/projects/project_task_form_widget.dart';
import 'package:provider/provider.dart';

class EditProjectDialog extends StatefulWidget {
  final Project project;

  const EditProjectDialog({Key? key, required this.project}) : super(key: key);

  @override
  State<EditProjectDialog> createState() => _EditProjectDialogState();
}

class _EditProjectDialogState extends State<EditProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  late String title;

  @override
  void initState() {
    super.initState();

    title = widget.project.title!;
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
                'Edit Project Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 8),
              ProjectFormWidget(
                title: title,
                onChangedTitle: (title) => setState(() => this.title = title),
                onSavedProject: saveProject,
              ),
            ],
          ),
        ),
      );

  void saveProject() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<ProjectProvider>(context, listen: false);
      provider.updateProject(
        widget.project,
        title,
      );

      Navigator.of(context).pop();
    }
  }
}
