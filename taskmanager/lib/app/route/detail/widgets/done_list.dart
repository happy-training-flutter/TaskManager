import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskmanager/app/core/utils/extension.dart';
import 'package:taskmanager/app/route/home/controller.dart';

class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doneTodos.isNotEmpty ?
        ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 2.0.wp),
              child: Text(
                'Completed ${homeCtrl.doneTodos.length} Task', 
                style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)
              ),
            ),
            ...homeCtrl.doneTodos.map((element) => 
              Dismissible(
                key: ObjectKey(element), 
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red.withOpacity(0.8),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 3.0.wp),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                onDismissed: (_) {
                  homeCtrl.deleteDoneTodo(element.title);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.0.wp,
                    vertical: 3.0.wp,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(Icons.done, color: Colors.blue),
                      ),
                      SizedBox(width: 3.0.wp),
                      Text(
                        element.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        ) 
        : Container()
    );
  }
}