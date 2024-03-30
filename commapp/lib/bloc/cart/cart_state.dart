part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoad extends CartState {
  const CartLoad(
      {this.cart = const CartModel(),
      this.isProductUpdated = false,
      this.totalPrice = 0});
  final bool isProductUpdated;
  final CartModel cart;
  final double totalPrice;

  @override
  List<Object> get props => [cart, isProductUpdated];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}