import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/app/ui/modules/core/widgets/drawer/custom_drawer.dart';
import 'package:loja_virtual/app/ui/modules/home/controllers/home_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja_virtual/app/ui/modules/products/product_page.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  final pageController = PageController();
  HomePage({Key? key}) : super(key: key);

  Widget _buildBodyBack() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      );
  Widget _buildHome() {
    return Scaffold(
        drawer: CustomDrawer(pageController: pageController),
        body: Obx(
          () => Stack(
            children: [
              _buildBodyBack(),
              CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text("Novidades "),
                      centerTitle: true,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    alignment: Alignment.center,
                    child: controller.listShowCase.isEmpty
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            children: controller.listShowCase.map((showcase) {
                              return StaggeredGridTile.count(
                                  crossAxisCellCount: showcase!.x!,
                                  mainAxisCellCount: showcase.y!,
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: showcase.image!,
                                    fit: BoxFit.cover,
                                  ));
                            }).toList(),
                          ),
                  )),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildHome(),
        ProductPage(pageController: pageController),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}
