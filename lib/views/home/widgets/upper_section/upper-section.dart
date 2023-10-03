// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_cart/api/api.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.amber,
                    size: 35,
                  ),
                  Text(
                    ' Shop Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: AutofillHints.addressCityAndState),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/1311433805/photo/side-view-profile-portrait-of-cute-african-american-girl.jpg?s=612x612&w=0&k=20&c=RsOSNextNfk0HgaXuZypGGKBYGmogQwtg5SNicwVOc4="),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: secondaryWhite),
                height: 50,
                width: 300,
                child: const Center(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none))),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () async {
                  await ApiServices().addProduct(
                      title: 'shirt',
                      category: "men's clothing",
                      description: 'description',
                      image: 'https://image',
                      price: '999');
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: secondaryWhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
          height10,
          const Text(
            'Items Back in Stock',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          height10,
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: primaryWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/page/category/laptop/emea-na-au-nz-my-sg-in-ph-id-vn-jp-kr-vostro-5630-with-fpr-rf-800x620.png?fmt=png-alpha&wid=800&hei=620"))),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HP Victus Core i5 12th Gen",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "15.6 Inch, Silver, 2.37 Kg, With MS Of..",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    height10,
                    Row(
                      children: [
                        Text(
                          '74,829',
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                        width10,
                        Text(
                          '₹63,990',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        width10,
                        Text(
                          "14% off",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          height10,
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: primaryWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.reliancedigital.in/medias/HP-V15-fa0998TX-493837767-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wxODQ4MDA0fGltYWdlL2pwZWd8aW1hZ2VzL2g2Yi9oYTIvMTAwMTE4NDcyOTUwMDYuanBnfDQxZWQwNGE3ZmY4MGNhNDBmN2RkMDRhZjdjYWMyOTI0YTY3MjU0YjE0NzJiOWE4NTFlYzk5NDc1ZjY3Nzg0ZDE"))),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HP Victus Core i5 11th Gen",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "16.1 Inch, Blue, 2.37 Kg, With MS Of..",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    height10,
                    Row(
                      children: [
                        Text(
                          '77,190',
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                        width10,
                        Text(
                          '₹65,800',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        width10,
                        Text(
                          "14% off",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          height10,
          const Text(
            'Category',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
