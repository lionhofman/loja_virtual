import 'package:loja_virtual/app/domain/entities/product.dart';
import 'package:loja_virtual/app/domain/repositories/products_repository.dart';

import 'package:dartz/dartz.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepository;
  GetProductsUseCase(this._productsRepository);

  Future<Either<Exception, List<Product?>>> call() async {
    return await _productsRepository.getProducts();
  }
}
