import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrutin/model/today_task.dart';
import 'package:myrutin/provider/today_task_provider.dart';
import 'package:myrutin/screen/widgets/today/today_task_form_widget.dart';
import 'package:provider/provider.dart';

class EditTodayTaskDialog extends StatefulWidget {
  final TodayTask todayTask;

  const EditTodayTaskDialog({Key? key, required this.todayTask})
      : super(key: key);

  @override
  State<EditTodayTaskDialog> createState() => _EditTodayTaskDialogState();
}

class _EditTodayTaskDialogState extends State<EditTodayTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.todayTask.title;
    description = widget.todayTask.description;
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
              TodayTaskFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodayTask: saveTodayTask,
              ),
            ],
          ),
        ),
      );

  void saveTodayTask() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TodayTaskProvider>(context, listen: false);
      provider.updateTodayTask(widget.todayTask, title, description);

      Navigator.of(context).pop();
    }
  }
}
