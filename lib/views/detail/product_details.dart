import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/controllers/cart/cart_bloc.dart';
import 'package:shop_cart/models/product_model.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          title: Text(
            product.title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height10,
                imageContainer(image: product.image),
                height20,
                priceRow(prize: product.price),
                height10,
                Text(
                  product.category.toUpperCase(),
                  maxLines: 7,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                height10,
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Text(
                      " ${product.rating}",
                      style: const TextStyle(color: Colors.amberAccent),
                    ),
                    Text(
                      " ${product.ratingCount} Rating",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                height10,
                Text(
                  product.description,
                  maxLines: 7,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                height20,
                addToCart()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row addToCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Container(
            width: 230,
            height: 65,
            decoration: BoxDecoration(
              color: primaryWidgetColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Buy now",
                  style: TextStyle(
                      fontSize: 18,
                      color: primaryWhite,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                context
                    .read<CartBloc>()
                    .add(AddToCartAndRemove(product: product, add: true));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: primaryWidgetColor,
                  content: const Text('Successfully added to cart'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      context.read<CartBloc>().add(
                          AddToCartAndRemove(product: product, add: false));
                    },
                  ),
                ));
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: primaryWidgetColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_grocery_store_rounded,
                  color: primaryWhite,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Row priceRow({required String prize}) {
    return Row(
      children: [
        const Text(
          "Description",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: primaryWhite),
        ),
        const Spacer(),
        Text(
          "₹ $prize",
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: primaryWhite),
        ),
        width10,
      ],
    );
  }

  Container imageContainer({required image}) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryWhite,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
