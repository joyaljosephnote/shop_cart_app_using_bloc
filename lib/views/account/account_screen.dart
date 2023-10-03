import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: primaryWhite),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.switch_account_rounded,
                color: primaryWhite,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            height10,
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  color: primaryWidgetColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/1311433805/photo/side-view-profile-portrait-of-cute-african-american-girl.jpg?s=612x612&w=0&k=20&c=RsOSNextNfk0HgaXuZypGGKBYGmogQwtg5SNicwVOc4="),
                      fit: BoxFit.cover)),
            ),
            height20,
            const Text(
              "Jesna Joseph",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            height5,
            const Text(
              "hellotechmalayalam@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            height20,
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit Account",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.arrow_right_square,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            height10,
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            height10,
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.arrow_right_square,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            height10,
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
