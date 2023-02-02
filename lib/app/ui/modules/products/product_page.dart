import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:loja_virtual/app/ui/modules/categories/category_widget.dart';
import 'package:loja_virtual/app/ui/modules/core/widgets/drawer/custom_drawer.dart';
import 'package:loja_virtual/app/ui/modules/products/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  final PageController? pageController;
  const ProductPage({this.pageController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(pageController: pageController!),
      body: Container(
          child: CategoryWidget(
        controller: controller,
        pageController: pageController!,
      )),
    );
  }
}
