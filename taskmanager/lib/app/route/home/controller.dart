import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/data/models/task.dart';
import 'package:taskmanager/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;

  final tasks = <Task>[].obs;
  final task = Rx<Task?>(null);

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editController.dispose();
    super.onClose();
  }

  void changeChipIndex(int index) => chipIndex.value = index;

  void changeDeleting(bool value) => deleting.value = value;

  void changeTask(Task? task) => this.task.value = task;

  bool addTask(Task task) {
    if(tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  bool updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    
    if (containTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo.toString());
    var newTask = task.copyWith(todos: todos);
    int oldIdx = tasks.indexOf(task);
    tasks[oldIdx] = newTask;
    tasks.refresh();
    return true;
  }

  bool containTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }
}