import 'package:flutter/material.dart';
import 'package:shop_cart/models/product_model.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

// heights

const height10 = SizedBox(height: 10);
const height5 = SizedBox(height: 5);
const height20 = SizedBox(height: 20);
const height30 = SizedBox(height: 30);

// width

const width10 = SizedBox(width: 10);
const width20 = SizedBox(width: 20);
const width30 = SizedBox(width: 30);

// Lists

List<ProductModel> cartItems = [];
List<ProductModel> productList = [];
