import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_controller.dart';

//class MyAppGetView extends GetWidget<CountController> {
class MyAppGetView extends GetView<CountController> {
  const MyAppGetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// is Rebuilding  and change hash code
    //   Using this in Get View Get.put(CountController());
    Get.put(CountController());
    return Scaffold(
      appBar: AppBar(title: const Text("Counter View Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(controller.count.toString())),
            TextButton(child: const Text("increment"), onPressed: () => controller.increment())
          ],
        ),
      ),
    );
  }
}
