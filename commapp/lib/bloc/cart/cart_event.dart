part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitialized extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  const CartProductAdded(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  const CartProductRemoved(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class CartProductIncremented extends CartEvent {
  const CartProductIncremented(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class CartProductDecremented extends CartEvent {
  const CartProductDecremented(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}