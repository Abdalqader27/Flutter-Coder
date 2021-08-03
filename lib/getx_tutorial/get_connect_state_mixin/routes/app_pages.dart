import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const kInit = Routes.kHome;

  static final routes = [
    GetPage(
      name: _Paths.kHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
