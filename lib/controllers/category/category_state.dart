part of 'category_bloc.dart';

class CategoryState {
  final int isSelectedIndex;
  CategoryState({required this.isSelectedIndex});
}

final class CategoryInitial extends CategoryState {
  CategoryInitial() : super(isSelectedIndex: 0);
}
