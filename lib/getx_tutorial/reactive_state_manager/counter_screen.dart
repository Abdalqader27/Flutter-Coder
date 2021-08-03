import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);
  var count = 0.obs;

  void increment() => count++;

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(count.toString())),
            TextButton(child: const Text("increment"), onPressed: () => increment())
          ],
        ),
      ),
    );
  }
}
