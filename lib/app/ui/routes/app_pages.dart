import 'package:get/get.dart';
import 'package:loja_virtual/app/ui/modules/home/home_binding.dart';
import 'package:loja_virtual/app/ui/modules/home/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
