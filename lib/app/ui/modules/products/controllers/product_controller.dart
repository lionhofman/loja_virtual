import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/app/domain/entities/product.dart';

import 'package:loja_virtual/app/domain/usecases/products/get_products_use_case.dart';

class ProductController extends GetxController {
  GetProductsUseCase getProductsUseCase;
  List<Product?> _listProducts = <Product>[].obs;

  List<Product?> get listProducts => _listProducts;

  ProductController(
    this.getProductsUseCase,
  );
  @override
  void onInit() async {
    super.onInit();
    asyncInit();
  }

  void asyncInit() async {
    getProducts();
  }

  Future<void> getProducts() async {
    Either<Exception, List<Product?>> products =
        await getProductsUseCase.call();

    products.fold((l) {
      print("Failure in the query to home showCase");
    }, (data) {
      _listProducts.clear();
      _listProducts = data.obs;
      print("TOTAL DE ${_listProducts.length}");
    });
  }
}
