import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialog")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                child: const Text("Show Dialog"),
                onPressed: () {
                  Get.defaultDialog(
                      onConfirm: () => Get.back(),
                      onCancel: () {},
                      title: "title",
                      middleText: "middle text",
                      textCancel: "cancel",
                      textConfirm: "confirm",
                      content: const CircularProgressIndicator(),
                      radius: 20,
                      barrierDismissible: false,
                      confirmTextColor: Colors.white);
                })
          ],
        ),
      ),
    );
  }
}
