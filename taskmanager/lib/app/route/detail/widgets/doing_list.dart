import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/core/utils/extension.dart';
import 'package:taskmanager/app/route/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
          ? Column(
            children: [
              SizedBox(height: 12.0.wp),
              Image.asset('assets/images/task.jpg', fit: BoxFit.cover, width: 65.0.wp),
              SizedBox(height: 12.0.wp),
              Text('Add Task', style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold)),
            ],
          ) 
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                ...homeCtrl.doingTodos.map((element) => 
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                    vertical: 3.0.wp,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          fillColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                          value: element.done,
                          onChanged: (value) => homeCtrl.doneTodos,
                        ),
                      ),
                      SizedBox(width: 3.0.wp),
                      Text(
                        element.title,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              )],
          ),
    );
  }
}