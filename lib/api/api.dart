import 'dart:convert';
import 'dart:developer';
import 'package:shop_cart/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static const getAllProductUrl = "https://fakestoreapi.com/products/";
  static const addProductUrl = "https://fakestoreapi.com/products/";
  static const categoryUrl =
      "https://fakestoreapi.com/products/category/jewelery";
}

class ApiServices {
  //singleton
  ApiServices._();
  static final ApiServices instance = ApiServices._();
  factory ApiServices() => instance;

  Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(Uri.parse(ApiConstants.getAllProductUrl));
    if (response.statusCode == 200) {
      final resposnseData = jsonDecode(response.body) as List;
      // log("Get all products ${response.statusCode}");
      return resposnseData
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Somthing went Wrong!');
    }
  }

  Future<void> addProduct({
    required title,
    required price,
    required description,
    required image,
    required category,
  }) async {
    final response =
        await http.post(Uri.parse(ApiConstants.addProductUrl), body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });
    if (response.statusCode == 200) {
      log("New Product added Successfully ${response.statusCode}");
    }
  }
}
