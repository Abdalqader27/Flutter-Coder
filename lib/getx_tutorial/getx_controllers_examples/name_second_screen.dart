import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_controller.dart';

// ignore: must_be_immutable
class NameSecondScreen extends StatelessWidget {
 const  NameSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Object Second Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetX<MyController>(
              init: MyController(),
              builder: (data) => Column(
                children: [
                  Text(data.student.name.toString()),

                  ///   you can replace this
                  //   RaisedButton(child: Text("upper"), onPressed: () => data.toUpperCase())
                ],
              ),
            ),
            TextButton(
              child: const Text("upper"),
              onPressed: () => Get.find<MyController>().toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
