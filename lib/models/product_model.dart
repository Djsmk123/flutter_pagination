import 'package:pagination_in_flutter/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final RatingModel rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
  toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "price": price,
      "image": image,
      "rating": rating.toJson(),
    };
  }
}
