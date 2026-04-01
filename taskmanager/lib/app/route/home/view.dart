import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/core/utils/extension.dart';
import 'package:taskmanager/app/route/home/controller.dart';
import 'package:taskmanager/app/route/home/widgets/add_cart.dart';

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
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [AddCart()],
            )
          ],
        )
      )
    );
  }
}