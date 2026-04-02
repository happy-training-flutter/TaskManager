import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/core/utils/extension.dart';
import 'package:taskmanager/app/core/values/colors.dart';
import 'package:taskmanager/app/data/models/task.dart';
import 'package:taskmanager/app/route/home/controller.dart';
import 'package:taskmanager/app/route/home/widgets/add_cart.dart';
import 'package:taskmanager/app/route/home/widgets/add_dialog.dart';
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
                  .map((element) => LongPressDraggable(
                    data: element,
                    onDragStarted: () => controller.changeDeleting(true),
                    onDragEnd: (_) => controller.changeDeleting(false),
                    onDraggableCanceled: (_, _) => controller.changeDeleting(false),
                    feedback: Opacity(
                      opacity: 0.8, 
                      child: TaskCard(task: element),
                    ),
                    child: TaskCard(task: element)
                  )),
                AddCart()
              ],
            )),
          ],
        )
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, _, _) {
          return Obx(() =>
            FloatingActionButton(
              onPressed: () {
                if (controller.tasks.isNotEmpty) {
                  Get.to(()=> AddDialog());
                } else {
                  EasyLoading.showInfo('Please add task type');
                }
              },
              backgroundColor: controller.deleting.value ? Colors.red : blue,
              foregroundColor: Colors.white,
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Delete Success');
        } 
      ),
    );
  }
}