import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_third_screen.dart';

class NavigationSecondScreen extends StatelessWidget {
  const NavigationSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Get.arguments.toString()),
            TextButton(
                child: const Text("go to third screen"),
                onPressed: () => Get.to(
                      const NavigationThirdScreen(),
                    )),
            TextButton(
                child: const Text("Back To First Screen"),
                onPressed: () => Get.back(result: "this is result from 2 screen")),
          ],
        ),
      ),
    );
  }
}
