import 'package:flutter/material.dart';
import 'package:loja_virtual/app/domain/entities/product.dart';

class CategoryTile extends StatelessWidget {
  final Product product;
  const CategoryTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(product.icon!),
      ),
      title: Text(product.title!),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}
