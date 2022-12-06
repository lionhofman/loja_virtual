import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/app/ui/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Obx(
          () => Stack(
            children: [
              _buildBodyBack(),
              Center(
                child: Container(
                  child: Text("Total de ${controller.listShowCase.length}"),
                ),
              ),
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
                        height: 200,
                        alignment: Alignment.center,
                        child: controller.listShowCase.isEmpty
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                "Total de ${controller.listShowCase.length}")),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
