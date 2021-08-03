import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_controller.dart';

// ignore: must_be_immutable
class NameScreen extends StatelessWidget {
  NameScreen({Key? key}) : super(key: key);
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Name Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(myController.student.name.toString())),
            TextButton(child: const Text("upper"), onPressed: () => myController.toUpperCase())
          ],
        ),
      ),
    );
  }
}
