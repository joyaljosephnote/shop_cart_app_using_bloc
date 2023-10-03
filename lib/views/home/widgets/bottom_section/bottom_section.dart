import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_cart/controllers/product/product_bloc.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/views/home/widgets/best_selling/best_selling.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state.fetching) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) => SizedBox(
              child: Shimmer.fromColors(
                  baseColor: secondaryWhite,
                  highlightColor: Colors.white24,
                  child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                        color: secondaryWhite,
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          itemCount: state.viewAll ? 2 : state.categoryList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) =>
              BestSelling(product: state.categoryList[index]),
        );
      }),
    );
  }
}
