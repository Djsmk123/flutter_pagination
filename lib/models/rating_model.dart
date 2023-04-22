class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
        rate: (json['rate'] as num).toDouble(), count: json['count']);
  }
  toJson() {
    return {"rate": rate, "count": count};
  }
}
