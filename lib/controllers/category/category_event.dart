part of 'category_bloc.dart';

class CategoryEvent {}

class CategorySelected extends CategoryEvent {
  final int index;
  CategorySelected({required this.index});
}
