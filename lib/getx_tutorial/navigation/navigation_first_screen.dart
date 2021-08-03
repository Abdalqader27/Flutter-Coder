import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_second_screen.dart';

class NavigationFirstScreen extends StatelessWidget {
  const NavigationFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                child: const Text("go to second screen"),
                onPressed: () async {
                  var data = await Get.to(const NavigationSecondScreen(),
                      transition: Transition.fade,
                      fullscreenDialog: true,
                      arguments: "arguments from screen 1 ",
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 500));
                  if (data != null) Get.snackbar(data, "message", snackPosition: SnackPosition.BOTTOM);
                })
          ],
        ),
      ),
    );
  }
}
