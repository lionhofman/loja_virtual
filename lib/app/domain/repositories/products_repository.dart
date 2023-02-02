import 'package:dartz/dartz.dart';
import 'package:loja_virtual/app/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Exception, List<Product?>>> getProducts();
}
