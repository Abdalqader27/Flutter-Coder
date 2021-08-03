import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAndThemeScreen extends StatelessWidget {
  const BottomSheetAndThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Sheet")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                child: const Text("Show Bottom Sheet"),
                onPressed: () => Get.bottomSheet(
                      Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: Wrap(
                            children: [
                              ListTile(
                                  leading: Icon(Icons.wb_sunny_outlined, color: Get.theme.primaryColor),
                                  title: Text("Light Theme", style: TextStyle(color: Get.theme.primaryColor)),
                                  onTap: () => Get.changeTheme(ThemeData.light())),
                              ListTile(
                                  leading: Icon(Icons.wb_sunny, color: Get.theme.primaryColor),
                                  title: Text("Dark Theme", style: TextStyle(color: Get.theme.primaryColor)),
                                  onTap: () => Get.changeTheme(ThemeData.dark())),
                            ],
                          )),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ))
          ],
        ),
      ),
    );
  }
}
