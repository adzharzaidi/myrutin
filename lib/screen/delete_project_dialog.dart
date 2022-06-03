import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/project.dart';
import '../provider/project_provider.dart';
import '../utils/show_snack_bar.dart';

class DeleteProject extends StatelessWidget {
  final Project project;
  const DeleteProject({Key? key, required this.project}) : super(key: key);
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Delete ${project.title}?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              buildButton(context),
            ],
          ),
        ),
      );
  Widget buildButton(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () => deleteProject(context, project),
          child: Text('Delete'),
        ),
      );
  void deleteProject(BuildContext context, Project project) {
    final provider = Provider.of<ProjectProvider>(context, listen: false);
    provider.removeProject(project);
    Navigator.of(context).pop();
    Utils.showSnackBar(context, 'Project Deleted');
  }
}
