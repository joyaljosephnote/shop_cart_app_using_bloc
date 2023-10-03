import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/controllers/category/category_bloc.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categoryList,
  });

  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) =>
            CategoryCardWidget(categoryList: categoryList, index: index),
        separatorBuilder: (context, index) => width10,
      ),
    );
  }
}

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget(
      {super.key, required this.categoryList, required this.index});
  final int index;
  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        var selected = index == state.isSelectedIndex;
        return Padding(
          padding: EdgeInsets.only(
              left: index == 0 ? 15 : 0,
              right: index == categoryList.length - 1 ? 15 : 0),
          child: InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              context.read<CategoryBloc>().add(CategorySelected(index: index));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selected ? primaryWidgetColor : primaryWhite,
                  borderRadius: BorderRadius.circular(13)),
              height: 30,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    categoryList[index],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: selected ? primaryWhite : Colors.black),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
