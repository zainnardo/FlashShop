
import 'package:commapp/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  const CartModel({this.products = const <ProductModel>[]});

  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}