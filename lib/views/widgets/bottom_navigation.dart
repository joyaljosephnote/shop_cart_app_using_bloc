import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/controllers/bottom_navigaion/bottom_navigation_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: state.value,
            onTap: (value) => context
                .read<BottomNavigationBloc>()
                .add(BottomNavigationValueChangeEvent(value: value)),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_grocery_store_rounded), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'Account'),
            ]);
      },
    );
  }
}
