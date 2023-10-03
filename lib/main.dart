import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/api/api.dart';
import 'package:shop_cart/controllers/bottom_navigaion/bottom_navigation_bloc.dart';
import 'package:shop_cart/controllers/cart/cart_bloc.dart';
import 'package:shop_cart/controllers/category/category_bloc.dart';
import 'package:shop_cart/controllers/product/product_bloc.dart';
import 'package:shop_cart/views/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices().getAllProducts();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavigationBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(),
          ),
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Bloc and API Integration',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainPage(),
        ),
      ),
    );
  }
}
