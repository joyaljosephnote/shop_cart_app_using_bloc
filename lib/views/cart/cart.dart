import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/controllers/cart/cart_bloc.dart';
import 'package:shop_cart/utils/constants.dart';
import 'package:shop_cart/views/cart/cart_list_widget/cart_list_widget.dart';
import 'package:shop_cart/views/cart/price_detail_card/price_detail_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            height20,
            const Text(
              "My Cart",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            height10,
            const CartListWidget(),
            height10,
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                num totalAmount = state.cartList.fold<double>(
                        0.0,
                        (previousValue, element) =>
                            previousValue +
                            (double.tryParse(element.price) ?? 0.0)) -
                    10 +
                    40;
                num totalProductAmount = state.cartList.fold<double>(
                    0.0,
                    (previousValue, element) =>
                        previousValue +
                        (double.tryParse(element.price) ?? 0.0));
                return state.cartList.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            SizedBox(height: 250.h),
                            Text(
                              "Cart is empty",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ])
                    : PriceDetailCard(
                        totalProductAmount: totalProductAmount,
                        totalAmount: totalAmount,
                        state: state,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
