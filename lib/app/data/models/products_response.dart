import 'package:loja_virtual/app/domain/entities/product.dart';

class ProductsResponse extends Product {
  ProductsResponse({
    required super.title,
    required super.icon,
  });

  factory ProductsResponse.fromFirestore(
    Map<String, dynamic> dataSnapshot,
  ) {
    return ProductsResponse(
      title: dataSnapshot['title'],
      icon: dataSnapshot['icon'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "icon": icon,
    };
  }
}
