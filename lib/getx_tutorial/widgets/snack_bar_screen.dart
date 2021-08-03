import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SnackBar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                child: const Text("Show SnackBar"),
                onPressed: () => Get.snackbar(
                      "title snackBar",
                      "this message by snack bar ",
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(10),
                    ))
          ],
        ),
      ),
    );
  }
}
