import 'package:get/get.dart';
import 'package:loja_virtual/app/data/datasources/products_remote_data_source.dart';
import 'package:loja_virtual/app/domain/repositories/products_repository.dart';
import 'package:loja_virtual/app/domain/usecases/products/get_products_use_case.dart';
import 'package:loja_virtual/app/ui/modules/products/controllers/product_controller.dart';

import '../../../data/repositories/products_repository_impl.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRemoteDataSource>(() => ProductsRemoteDataSourceImpl());
    Get.lazyPut<ProductsRepository>(
        () => ProductsRepositoryImpl(Get.find<ProductsRemoteDataSource>()));
    Get.lazyPut(() => GetProductsUseCase(Get.find<ProductsRepository>()));
    Get.lazyPut<ProductController>(
        () => ProductController(Get.find<GetProductsUseCase>()));
  }
}
