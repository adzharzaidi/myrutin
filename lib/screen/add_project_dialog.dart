import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';
import '../provider/project_provider.dart';
import 'add_project_form.dart';

class AddProject extends StatefulWidget {
  AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Project',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              ProjectFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onSavedProject: addProject,
              ),
            ],
          ),
        ),
      );

  void addProject() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      final project = Project(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
      );
      final provider = Provider.of<ProjectProvider>(context, listen: false);
      provider.generateProject(project);
      Navigator.of(context).pop();
    }
  }
}
