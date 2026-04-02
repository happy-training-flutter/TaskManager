import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/core/utils/extension.dart';
import 'package:taskmanager/app/data/models/task.dart';
import 'package:taskmanager/app/route/home/controller.dart';
import 'package:taskmanager/app/route/home/widgets/add_cart.dart';
import 'package:taskmanager/app/route/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My List', 
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Obx(() => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...controller.tasks
                  .map((element) => TaskCard(task: element)),
                TaskCard(task: Task(title: 'title', icon: 0xe59c, color: '2B60E6', todos: [])),
                AddCart()
              ],
            )),
          ],
        )
      )
    );
  }
}