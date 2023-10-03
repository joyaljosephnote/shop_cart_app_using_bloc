part of 'product_bloc.dart';

class ProductEvent {}

class GetAllProductEvent extends ProductEvent {}

class ViewAllButtonEvent extends ProductEvent {
  final bool isView;
  ViewAllButtonEvent({required this.isView});
}
