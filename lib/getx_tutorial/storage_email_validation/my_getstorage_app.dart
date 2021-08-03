import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyGetStorageApp extends StatelessWidget {
  const MyGetStorageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var storage = GetStorage();
    return Scaffold(
      appBar: AppBar(title: const Text("Storage And Valid Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: TextField(controller: emailController)),
            const SizedBox(height: 8),
            TextButton(
                child: const Text("Write"),
                onPressed: () {
                  if (GetUtils.isEmail(emailController.text)) {
                    storage.write('email', emailController.text);
                  } else {
                    Get.snackbar("Incorrect Email", "Provide Email  in correct Format");
                  }
                }),
            const SizedBox(height: 8),
            TextButton(
              child: const Text("Read"),
              onPressed: () => debugPrint("The Email  is  ${storage.read('email')}"),
            ),
          ],
        ),
      ),
    );
  }
}
