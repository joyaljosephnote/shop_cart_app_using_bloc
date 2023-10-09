import 'dart:convert';
import 'dart:developer';
import 'package:shop_cart/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static const getAllProductUrl = "https://fakestoreapi.com/products/";
  static const addProductUrl = "https://fakestoreapi.com/products/";
  static const categoryUrl =
      "https://fakestoreapi.com/products/category/jewelery";
  static const updateProduct = 'https://fakestoreapi.com/products/';
  static const delete = 'https://fakestoreapi.com/products/';
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
      log("Get all products ${response.statusCode}");
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

  Future<void> upDateProduct(
      {required ProductModel product, required bool put}) async {
    if (put == true) {
      final response = await http
          .put(Uri.parse("${ApiConstants.updateProduct}${product.id}"), body: {
        'title': product.title,
        "price": product.price,
        "description": product.description,
        "image": product.image,
        "category": product.category,
      });
      if (response.statusCode == 200) {
        log('Product updated succesfully');
      } else {
        log(response.statusCode.toString());
      }
    } else if (put == false) {
      final response = await http.patch(
          Uri.parse("${ApiConstants.updateProduct}${product.id}"),
          body: {
            'title': product.title,
            "price": product.price,
            "description": product.description,
            "image": product.image,
            "category": product.category,
          });
      if (response.statusCode == 200) {
        log('Product partialy updated');
      } else {
        log(response.statusCode.toString());
      }
    }
  }

  Future<void> deleteProduct({required ProductModel product}) async {
    final response =
        await http.delete(Uri.parse('${ApiConstants.delete}${product.id}'));
    if (response.statusCode == 200) {
      log('Product deleted');
    } else {
      log(response.statusCode.toString());
    }
  }
}
