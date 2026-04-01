import 'package:get/get.dart';
import 'package:taskmanager/app/data/provider/task/provider.dart';
import 'package:taskmanager/app/data/services/storage/repository.dart';
import 'package:taskmanager/app/route/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider()
        ),
      ),
    );
  }
}
