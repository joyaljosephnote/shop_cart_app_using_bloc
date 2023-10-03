import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/controllers/bottom_navigaion/bottom_navigation_bloc.dart';
import 'package:shop_cart/views/account/account_screen.dart';
import 'package:shop_cart/views/cart/cart.dart';
import 'package:shop_cart/views/home/home_screen.dart';
import 'package:shop_cart/views/widgets/bottom_navigation.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List<Widget> bodyScreens = [
    HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            return bodyScreens[state.value];
          },
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
