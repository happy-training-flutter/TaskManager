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

  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

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

  void changeTodos(List<dynamic> select) {
    doingTodos.clear();
    doneTodos.clear();
    for (int i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo.toString().contains('done: true');
      if (status) {
        doneTodos.add(todo.toString());
      } else {
        doingTodos.add(todo.toString());
      }
    }
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
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

    // if (containTodo(todos, title)) {
    //   return false;
    // }
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

  bool addTodo(String title) {
    var todo = {'title': title, 'done': false};
    doingTodos.add(todo.toString());
    return true;
  }

  void updateTodos() {
    List<String> newTodos = [];
    newTodos.addAll([...doingTodos, ...doneTodos]);

    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void doneTodo() {
    
  }
}
