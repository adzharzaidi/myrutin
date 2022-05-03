import 'package:flutter/material.dart';
import 'package:myrutin/provider/today_task_provider.dart';
import 'package:myrutin/screen/widgets/today/today_task_form_widget.dart';
import 'package:provider/provider.dart';
import '../../../model/today_task.dart';

class TaskDialog extends StatefulWidget {
  TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
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
              TodayTaskFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodayTask: addTodayTask,
              ),
            ],
          ),
        ),
      );
  void addTodayTask() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      final todayTask = TodayTask(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );
      final provider = Provider.of<TodayTaskProvider>(context, listen: false);
      provider.addTodayTask(todayTask);
      Navigator.of(context).pop();
    }
  }
}
