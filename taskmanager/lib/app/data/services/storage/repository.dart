import 'package:taskmanager/app/data/models/task.dart';
import 'package:taskmanager/app/data/provider/task/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTasks() {
    return taskProvider.readTasks();
  }

  void writeTasks(List<Task> tasks) {
    taskProvider.writeTasks(tasks);
  }
}