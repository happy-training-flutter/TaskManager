import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskmanager/app/data/services/storage/services.dart';
import 'package:taskmanager/app/route/home/binding.dart';
import 'package:taskmanager/app/route/home/view.dart';

void main() async{
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Management App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}

