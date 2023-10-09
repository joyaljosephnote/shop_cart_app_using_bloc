import 'package:flutter/material.dart';
import 'package:shop_cart/api/api.dart';
import 'package:shop_cart/models/product_model.dart';

class ProductUpdationButton extends StatelessWidget {
  const ProductUpdationButton({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              ApiServices().upDateProduct(product: productModel, put: true);
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 33,
              color: Colors.purple,
            )),
        IconButton(
            onPressed: () {
              ApiServices().upDateProduct(product: productModel, put: false);
            },
            icon: const Icon(
              Icons.favorite,
              size: 33,
              color: Colors.purple,
            )),
        IconButton(
            onPressed: () {
              ApiServices().upDateProduct(product: productModel, put: false);
            },
            icon: const Icon(
              Icons.delete,
              size: 33,
              color: Colors.purple,
            )),
      ],
    );
  }
}
