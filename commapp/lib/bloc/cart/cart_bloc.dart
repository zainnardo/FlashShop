
import 'package:commapp/models/cart_model.dart';
import 'package:commapp/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialized>(_onInitialized);
    on<CartProductAdded>(_onProductAdded);
    on<CartProductRemoved>(_onProductRemoved);
    on<CartProductIncremented>(_onProductIncremented);
    on<CartProductDecremented>(_onProductDecremented);
  }

  final _items = <ProductModel>[];

  void addItemToCart(ProductModel product) {
    if (isProductInCart(product)) {
      incrementProduct(product);
    } else {
      _items.add(product);
    }
  }

  bool isProductInCart(ProductModel product) {
    return _items
        .any((checkedProduct) => checkedProduct.title == product.title);
  }

  void removeItemFromCart(ProductModel product) => _items.remove(product);

  void _onInitialized(CartInitialized event, Emitter<CartState> emit) {
    emit(CartInitial());
    try {
      final items = _items;
      emit(CartLoad(cart: CartModel(products: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  void incrementProduct(ProductModel product) {
    product.count++;
  }

  void decrementProduct(ProductModel product) {
    if (product.count > 1) {
      product.count--;
    } else {
      _items.remove(product);
    }
  }

  Future<void> _onProductIncremented(
      CartProductIncremented event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoad) {
      try {
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: false,
          ),
        );
        incrementProduct(event.product);
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: true,
            totalPrice: state.totalPrice + event.product.price!.toDouble(),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  Future<void> _onProductDecremented(
      CartProductDecremented event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoad) {
      try {
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: false,
          ),
        );
        decrementProduct(event.product);
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: true,
            totalPrice: state.totalPrice - event.product.price!.toDouble(),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  Future<void> _onProductAdded(
      CartProductAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoad) {
      try {
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: false,
          ),
        );
        addItemToCart(event.product);
        emit(
          CartLoad(
            cart: CartModel(
              products: [..._items],
            ),
            isProductUpdated: true,
            totalPrice: state.totalPrice + event.product.price!.toDouble(),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoad) {
      try {
        removeItemFromCart(event.product);
        if (_items.isEmpty) {
          emit(
            const CartLoad(
              totalPrice: 0,
            ),
          );
        }
        emit(
          CartLoad(
            cart: CartModel(
              products: [...state.cart.products]..remove(event.product),
            ),
            totalPrice: state.totalPrice -
                (event.product.count * event.product.price!.toDouble()),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}