import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myrutin/model/today_task.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../../provider/today_task_provider.dart';
import '../../../utils/show_snack_bar.dart';
import 'edit_today_task_dialog.dart';

class TodayWidget extends StatelessWidget {
  final TodayTask todayTask;
  const TodayWidget({Key? key, required this.todayTask, TodayTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        new EditTodayTaskDialog(todayTask: todayTask)),
                backgroundColor: COLOR_PURPLE,
                icon: Icons.edit,
                foregroundColor: COLOR_WHITE,
                label: 'Edit',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => deleteTodayTask(context, todayTask),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                foregroundColor: COLOR_WHITE,
                label: 'Delete',
              )
            ],
          ),
          key: Key(todayTask.id),
          child: buildTodayTask(context),
        ),
      );

  Widget buildTodayTask(BuildContext context) => Container(
        color: COLOR_WHITE,
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Checkbox(
              activeColor: COLOR_BLUE,
              checkColor: COLOR_WHITE,
              value: todayTask.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodayTaskProvider>(context, listen: false);
                final isDone = provider.toggleTodayTask(todayTask);

                Utils.showSnackBar(
                    context, isDone ? 'Task completed' : 'Task incomplete');
              },
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todayTask.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: COLOR_BLACK,
                    fontSize: 22,
                  ),
                ),
                if (todayTask.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todayTask.description,
                      style: TextStyle(
                          fontSize: 20, color: COLOR_GREY, height: 1.5),
                    ),
                  )
              ],
            ))
          ],
        ),
      );
  void deleteTodayTask(BuildContext context, TodayTask todayTask) {
    final provider = Provider.of<TodayTaskProvider>(context, listen: false);
    provider.removeTodayTask(todayTask);

    Utils.showSnackBar(context, 'Task Deleted');
  }

  void editTodayTask(BuildContext context, TodayTask todayTask) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodayTaskDialog(todayTask: todayTask),
        ),
      );
}
