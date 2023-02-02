import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/app/ui/modules/categories/category_tile.dart';
import 'package:loja_virtual/app/ui/modules/products/controllers/product_controller.dart';

class CategoryWidget extends StatelessWidget {
  final PageController pageController;
  final ProductController controller;

  const CategoryWidget(
      {required this.controller, required this.pageController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromARGB(255, 227, 225, 225),
        width: 1.5,
      ))),
      child: Obx(() => ListView.separated(
            itemCount: controller.listProducts.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 1,
                    color: const Color.fromARGB(255, 227, 225, 225),
                  ),
                ],
              );
            },
            itemBuilder: (context, index) {
              return CategoryTile(product: controller.listProducts[index]!);
            },
          )),
    );
  }
}
