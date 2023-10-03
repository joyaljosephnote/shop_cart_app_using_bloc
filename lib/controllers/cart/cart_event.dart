part of 'cart_bloc.dart';

class CartEvent {}

class AddToCartAndRemove extends CartEvent {
  final ProductModel product;
  final bool add;
  AddToCartAndRemove({required this.product, required this.add});
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;
  RemoveFromCart({required this.product});
}

class GetAllCartItems extends CartEvent {}
