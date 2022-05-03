import 'package:flutter/cupertino.dart';
import 'package:myrutin/model/today_task.dart';

class TodayTaskProvider extends ChangeNotifier {
  List<TodayTask> _todayTask = [
    TodayTask(
      createdTime: DateTime.now(),
      title: 'test',
      id: '1',
    ),
    TodayTask(
      createdTime: DateTime.now(),
      title: 'test2',
      id: '2',
      description: 'this is a test desc',
    ),
  ];
  List<TodayTask> get todayTask =>
      _todayTask.where((todayTask) => todayTask.isDone == false).toList();

  List<TodayTask> get TodayTaskCompleted =>
      _todayTask.where((todayTask) => todayTask.isDone == true).toList();

  void addTodayTask(TodayTask todayTask) {
    _todayTask.add(todayTask);
    notifyListeners();
  }

  void removeTodayTask(TodayTask todayTask) {
    _todayTask.remove(todayTask);
    notifyListeners();
  }

  bool toggleTodayTask(TodayTask todayTask) {
    todayTask.isDone = !todayTask.isDone;
    return todayTask.isDone;
  }

  void updateTodayTask(TodayTask todayTask, String title, String description) {
    todayTask.title = title;
    todayTask.description = description;

    notifyListeners();
  }
}
