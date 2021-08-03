import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInjectController extends GetxController {
  int count = 0;

  void incrementCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    count = (sharedPreferences.getInt('counter') ?? 0) + 1;
    debugPrint('Pressed count is  $count times ');
    await sharedPreferences.setInt('counter', count);
  }
}
