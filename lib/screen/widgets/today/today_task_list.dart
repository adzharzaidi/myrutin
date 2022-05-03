import 'package:flutter/material.dart';
import 'package:myrutin/model/project_task.dart';
import 'package:myrutin/model/today_task.dart';
import 'package:myrutin/provider/today_task_provider.dart';
import 'package:myrutin/screen/widgets/today/today_task_widget.dart';
import 'package:provider/provider.dart';

class TodayTaskList extends StatelessWidget {
  const TodayTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodayTaskProvider>(context);
    final todayTask = provider.todayTask;
    return todayTask.isEmpty
        ? Center(
            child: Text(
              'There are no tasks',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: todayTask.length,
            itemBuilder: (BuildContext context, int index) {
              final taskToday = todayTask[index];
              return TodayWidget(todayTask: taskToday);
            },
          );
  }
}
