import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/controllers/product/product_bloc.dart';
import 'package:shop_cart/utils/constants.dart';
import 'package:shop_cart/views/home/widgets/bottom_section/bottom_section.dart';
import 'package:shop_cart/views/home/widgets/category_section/categorry_section.dart';
import 'package:shop_cart/views/home/widgets/upper_section/upper-section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> categoryList = [
    "Electronics",
    "Fasion",
    "Grocery",
    "Mobiles",
    "Appliances",
  ];

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetAllProductEvent());
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UpperSection(),
            height10,
            Column(
              children: [
                CategoryList(categoryList: categoryList),
                height10,
                topRatedRow(context),
                height10,
                const BottomSection(),
                height10,
              ],
            ),
          ],
        ));
  }

  Padding topRatedRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Best Selling",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  if (state.viewAll) {
                    context
                        .read<ProductBloc>()
                        .add(ViewAllButtonEvent(isView: false));
                  } else {
                    context
                        .read<ProductBloc>()
                        .add(ViewAllButtonEvent(isView: true));
                  }
                },
                child: Row(
                  children: [
                    Text(
                      state.viewAll ? "View More" : "View Less",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      state.viewAll
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
