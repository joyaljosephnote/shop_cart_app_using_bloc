import 'package:bloc/bloc.dart';
import 'package:shop_cart/api/api.dart';
import 'package:shop_cart/models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetAllProductEvent>((event, emit) async {
      //initial data feching progress
      emit(ProductState(categoryList: [], fetching: true));
      final products = await ApiServices().getAllProducts();
      //Once fetched, emit another state.
      return emit(ProductState(categoryList: products, fetching: false));
    });
    on<ViewAllButtonEvent>((event, emit) {
      return emit(ProductState(
          categoryList: state.categoryList,
          viewAll: event.isView ? true : false));
    });
  }
}
