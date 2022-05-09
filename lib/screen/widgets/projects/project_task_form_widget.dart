import 'package:flutter/material.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectTaskFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedProjectTask;

  const ProjectTaskFormWidget(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedProjectTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 10),
            buildButton(),
          ],
        ),
      );
  Widget buildTitle() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Title',
        ),
      );
  Widget buildDescription() => TextFormField(
        initialValue: description,
        maxLines: 2,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Description',
        ),
      );
  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(COLOR_PURPLE),
          ),
          onPressed: onSavedProjectTask,
          child: Text('Save'),
        ),
      );
}
