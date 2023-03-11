import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mini_store/models/category.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:mini_store/models/user_model.dart';

class ApiHandler with ChangeNotifier {
  static Future<List<dynamic>> getAllProducts({required String path}) async {
    try {
      final uri = Uri.parse("https://api.escuelajs.co/api/v1/$path");
      final Response response = await http.get(uri);
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      final jsonData = jsonDecode(response.body) as List;
      return jsonData;
    } catch (error) {
      log("An error occured $error");
      throw error.toString();
    }
  }

  static Future<List<ProductModel>> getProduct() async {
    final items = await getAllProducts(path: "products");
    return ProductModel.productFromSnapshot(items);
  }

  static Future<List<CategoryProduct>> getCategory() async {
    final items = await getAllProducts(path: "categories");
    return CategoryProduct.categoryProductFromSnapshot(items);
  }

  static Future<List<UserModel>> getUser() async {
    final items = await getAllProducts(path: "users");
    return UserModel.userFromSnapshot(items);
  }

  static Future<ProductModel> getAllProductDetails({required String id}) async {
    try {
      final uri = Uri.parse("https://api.escuelajs.co/api/v1/products/$id");
      final Response response = await http.get(uri);
      final jsonData = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw jsonData['message'];
      }
      return ProductModel.fromJson(jsonData);
    } catch (error) {
      log("an error occured while getting product info $error");
      throw error.toString();
    }
  }
}
