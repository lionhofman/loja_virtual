import 'package:get/get.dart';
import 'package:loja_virtual/app/ui/modules/home/home_binding.dart';
import 'package:loja_virtual/app/ui/modules/home/home_page.dart';
import 'package:loja_virtual/app/ui/modules/products/product_binding.dart';
import 'package:loja_virtual/app/ui/modules/products/product_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.PRODUCTS,
      page: () => const ProductPage(),
      binding: ProductBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
