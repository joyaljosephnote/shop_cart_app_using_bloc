import 'package:bloc/bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategorySelected>((event, emit) {
      return emit(CategoryState(isSelectedIndex: event.index));
    });
  }
}
