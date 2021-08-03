import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_inject_controller.dart';

class MyInjectionApp extends StatelessWidget {
  const MyInjectionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.create<MyInjectionApp>(() =>MyInjectionApp());
    Get.putAsync<MyInjectController>(
      () async => MyInjectController(),
      tag: 'myInjection',
      permanent: true,
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("increment"),
              onPressed: () => Get.find<MyInjectController>(tag: 'myInjection').incrementCounter(),
            )
          ],
        ),
      ),
    );
  }
}
