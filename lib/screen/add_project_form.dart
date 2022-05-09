import 'package:flutter/material.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectFormWidget extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedProject;

  const ProjectFormWidget(
      {Key? key,
      this.title = '',
      required this.onChangedTitle,
      required this.onSavedProject})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 10),
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
  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(COLOR_PURPLE),
          ),
          onPressed: onSavedProject,
          child: Text('Save'),
        ),
      );
}
