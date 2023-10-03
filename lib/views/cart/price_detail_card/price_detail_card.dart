import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/controllers/cart/cart_bloc.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';

class PriceDetailCard extends StatelessWidget {
  const PriceDetailCard({
    super.key,
    required this.totalProductAmount,
    required this.totalAmount,
    required this.state,
  });

  final num totalProductAmount;
  final num totalAmount;
  final CartState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price Details",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: primaryWhite),
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price (${state.cartList.length} item)",
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                "₹ ${totalProductAmount.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          height10,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "- ₹10",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          height10,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Charges",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "₹40",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          height10,
          const Divider(),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: primaryWhite),
              ),
              Text(
                "₹${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: primaryWhite),
              )
            ],
          ),
          height20,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You will save ₹10 on this order",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.green),
              ),
            ],
          ),
          height10,
          state.cartList.isEmpty ? Container() : placeOrderContainer()
        ],
      ),
    );
  }

  Container placeOrderContainer() {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        "Place order",
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      )),
    );
  }
}
