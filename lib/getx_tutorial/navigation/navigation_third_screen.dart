import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_first_screen.dart';

class NavigationThirdScreen extends StatelessWidget {
  const NavigationThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("go to second screen"),
              onPressed: () => Get.back(),
            ),
            TextButton(
                child: const Text("go to first screen"),
                onPressed: () => Get.offAll(
                      const NavigationFirstScreen(),
                    )),
          ],
        ),
      ),
    );
  }
}
