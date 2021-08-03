import 'package:flutter/cupertino.dart';
import 'package:futter_coder/getx_tutorial/Models/student.dart';
import 'package:get/get.dart';

class MyBuilderController extends GetxController {
  Student student = Student();

  void toUpperCase() => {
        student.name.value = student.name.value.toUpperCase(),
        update(['first'])
      };

  void toLowerCase() => {student.name.value = student.name.value.toLowerCase(), update()};

  void myDispose() => debugPrint("has Stopped");
}
