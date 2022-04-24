import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/screen/widgets/projects/project_task_form_widget.dart';

class EditProjectTaskPage extends StatefulWidget {
  final ProjectTask projectTask;

  const EditProjectTaskPage({Key? key, required this.projectTask})
      : super(key: key);

  @override
  State<EditProjectTaskPage> createState() => _EditProjectTaskPageState();
}

class _EditProjectTaskPageState extends State<EditProjectTaskPage> {
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.projectTask.title;
    description = widget.projectTask.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Project Task'),
        ),
        body: ProjectTaskFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onSavedProjectTask: () {},
        ),
      );
}
