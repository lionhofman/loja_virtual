import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/app/data/models/products_response.dart';
import 'package:loja_virtual/app/domain/entities/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product?>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<Product?>> getProducts() {
    return handleProductsRequest();
  }

  Future<List<Product?>> handleProductsRequest() async {
    CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection("products");
    List<Product?> productsList = [];

    await collection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        productsList.add(ProductsResponse.fromFirestore(doc.data()));
      });
    });
    return productsList;
  }
}
