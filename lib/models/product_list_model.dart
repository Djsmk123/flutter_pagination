import 'package:pagination_in_flutter/models/product_model.dart';

class ProductsListModel {
  final List<ProductModel> products;
  final bool reachMax;
  final int currentPage;
  const ProductsListModel(
      {required this.products,
      required this.currentPage,
      required this.reachMax});
  factory ProductsListModel.fromJson(Map<String, dynamic> json) {
    return ProductsListModel(
        products: parseProducts(json['products']),
        currentPage: json['current_page'],
        reachMax: json['reach_max']);
  }
  Map<String, dynamic> toJson() {
    return {
      'products': products.map((e) => e.toJson()),
      'current_page': currentPage,
      'reach_max': reachMax
    };
  }

  static List<ProductModel> parseProducts(List<dynamic> p) {
    return List.generate(p.length, (index) => ProductModel.fromJson(p[index]));
  }
}
