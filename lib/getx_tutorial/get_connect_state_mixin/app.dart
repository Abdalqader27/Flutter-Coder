import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.kInit,
      getPages: AppPages.routes,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
