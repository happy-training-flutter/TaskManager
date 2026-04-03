import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final int icon;
  final String color;
  final List<TodoExmaple> todos;

  const Task({
    required this.title,
    required this.icon,
    required this.color,
    required this.todos,
  });

  Task copyWith({ // Method to create a copy of the Task with updated fields
    String? title,
    int? icon,
    String? color,
    List<TodoExmaple>? todos,
  }) {
    return Task(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      todos: todos ?? this.todos,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) { // Method to convert Task to JSON
    return Task(
      title: json['title'],
      icon: json['icon'],
      color: json['color'],
      todos: (json['todos'] as List)
          .map((e) => TodoExmaple.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() { // Method to convert JSON to Task
    return {
      'title': title,
      'icon': icon,
      'color': color,
      'todos': todos.map((e) => e.toJson()).toList(),
    };
  }
  
  @override
  // Equatable props for value comparison
  /* Why needed? 
    * This allows us to compare two Task instances based on their content rather than their reference in memory. 
    * When we override the props getter, we specify which properties should be used for equality comparison. 
    * In this case, we want to compare tasks based on their title, icon, and color. 
    * This is particularly useful when we want to check if two tasks are the same or when we want to update a task in a list without creating duplicates.
  */
  List<Object?> get props => [title, icon, color];
}


class TodoExmaple{
  final String title;
  final bool done;

  const TodoExmaple({  
    required this.title,
    required this.done,
  });

  TodoExmaple copyWith({ // Method to create a copy of the Todo with updated fields
    String? title,
    bool? done,
  }) {
    return TodoExmaple(
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }

  factory TodoExmaple.fromJson(Map<String, dynamic> json) { // Method to convert Todo to JSON
    return TodoExmaple(
      title: json['title'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() { // Method to convert JSON to Todo
    return {
      'title': title,
      'done': done,
    };
  }
  
  @override
  // Equatable props for value comparison
  /* Why needed? 
    * This allows us to compare two Todo instances based on their content rather than their reference in memory. 
    * When we override the props getter, we specify which properties should be used for equality comparison. 
    * In this case, we want to compare todos based on their title and done status. 
    * This is particularly useful when we want to check if two todos are the same or when we want to update a todo in a list without creating duplicates.
  */
  List<Object?> get props => [title, done];
}