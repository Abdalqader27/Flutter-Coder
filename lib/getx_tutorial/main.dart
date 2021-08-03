import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Implementing_Internationalization/messages.dart';
import 'get_connect_state_mixin/app.dart';
import 'get_view_and_get_widget/my_app_getview.dart';

void main() async {
  await GetStorage.init();
  //runApp(MyApp());
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// for multi languages
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // home: NavigationFirstScreen(),
      //  home: CounterScreen(),
      //   home: NameScreen(),
      //   home: NameSecondScreen(),
      //  home: TranslationScreen(),
      //   home: MyInjectionApp(),
      //  home: ProductListViewScreen(),
      //    home: MyGetStorageApp(),
      home: const MyAppGetView(),
    );
  }
}
