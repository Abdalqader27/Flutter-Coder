import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Translator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello'.tr),
            TextButton(
                child: const Text("To Arabic"),
                onPressed: () => Get.updateLocale(
                      const Locale('ar', 'SY'),
                    )),
            TextButton(
                child: const Text("To English"),
                onPressed: () => Get.updateLocale(
                      const Locale('en', 'US'),
                    )),
          ],
        ),
      ),
    );
  }
}
