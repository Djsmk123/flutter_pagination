import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_in_flutter/model/error_model.dart';
import 'package:pagination_in_flutter/model/product_list_model.dart';

class ProductRepo {
  static Future<Either<Failure, ProductsListModel>> getProducts(
      {required int page}) async {
    try {
      Map<String, String> query = {"page": page.toString()};
      var uri = Uri.parse(
              "https://flutter-pagination-api-djsmk123.vercel.app/api/get-products")
          .replace(queryParameters: query);
      final response =
          await http.get(uri, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        ProductsListModel products = ProductsListModel.fromJson(json);
        return Right(products);
      } else {
        return const Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Something went wrong'));
    }
  }
}
