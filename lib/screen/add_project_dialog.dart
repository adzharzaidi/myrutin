import 'package:flutter/material.dart';

class AddProject extends StatefulWidget {
  AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'add project',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ],
        ),
      );
}
