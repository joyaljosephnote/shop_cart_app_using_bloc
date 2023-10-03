import 'package:flutter/material.dart';
import 'package:shop_cart/models/product_model.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';
import 'package:shop_cart/views/detail/product_details.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(product: product),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: primaryWhite, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            height20,
            height10,
            Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),
            height10,
            Text(
              product.title.substring(0, 10),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  product.rating,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                width10,
                Text(
                  "₹ ${product.price}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
