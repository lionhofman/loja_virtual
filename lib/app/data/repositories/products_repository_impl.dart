import 'package:loja_virtual/app/data/datasources/products_remote_data_source.dart';
import 'package:loja_virtual/app/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:loja_virtual/app/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  ProductsRepositoryImpl(this._productsRemoteDataSource);
  @override
  Future<Either<Exception, List<Product?>>> getProducts() async {
    try {
      var products = await _productsRemoteDataSource.getProducts();
      return Right(products);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
