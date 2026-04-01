import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager/app/core/utils/keys.dart';
import 'package:taskmanager/app/data/models/task.dart';
import 'package:taskmanager/app/data/services/storage/services.dart';

class TaskProvider {
  // Instead of API call, we will use a local list to store tasks

  final _storageService = Get.find<StorageService>();

  // Data Format, we store tasks:
  // {'tasks': [
  //  {'title': 'Task 1', 
  //  'icon': 0xe3af, 
  //  'color': '#ff0000'}
  // ]}

  // Method to read tasks from storage
  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storageService.read(taskKey).toString())
        .forEach((task) => tasks.add(Task.fromJson(task)));
    return tasks;
  }

  // Method to write tasks to storage
  void writeTasks(List<Task> tasks) {
    _storageService.write(taskKey, jsonEncode(tasks));
  }
}