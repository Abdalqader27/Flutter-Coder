import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_builder_controller.dart';

// ignore: must_be_immutable
class BuilderScreen extends StatelessWidget {
  BuilderScreen({Key? key}) : super(key: key);
  MyBuilderController myBuilderController = Get.put(MyBuilderController());

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Builder  Screen ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<MyBuilderController>(
              init: myBuilderController,
              id: "first",
              dispose: (_) => myBuilderController.myDispose(),
              builder: (data) => Column(
                children: [
                  Text(data.student.name.toString()),

                  ///   you can replace this
                  //   RaisedButton(child: Text("upper"), onPressed: () => data.toUpperCase())
                ],
              ),
            ),
            GetBuilder<MyBuilderController>(
              init: myBuilderController,
              dispose: (_) => myBuilderController.myDispose(),
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
              onPressed: () => Get.find<MyBuilderController>().toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
