import 'package:commapp/models/base_model.dart';
import 'package:commapp/models/generators/product_generator.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class ProductModel extends BaseModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  int count;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.count = 1,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return $ProductModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

@JsonSerializable(createToJson: false)
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return $RatingFromJson(json);
  }
}