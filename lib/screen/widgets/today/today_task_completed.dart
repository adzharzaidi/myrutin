import 'package:flutter/material.dart';
import 'package:myrutin/screen/widgets/today/today_task_widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/today_task_provider.dart';

class TodayTaskCompleted extends StatelessWidget {
  const TodayTaskCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodayTaskProvider>(context);
    final todayTask = provider.TodayTaskCompleted;
    return todayTask.isEmpty
        ? Center(
            child: Text(
              'There are no task completed',
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
