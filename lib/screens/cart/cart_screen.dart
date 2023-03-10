import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isEmpty = true;
    return Scaffold(
      appBar: isEmpty
          ? null
          : CommonFunction.appBar(
              context: context,
              text: 'Cart (2)',
              isSuffix: true,
              suffixPress: () async {
                await CommonFunction.warningDialog(
                    context: context,
                    text: 'Empty your cart',
                    subTitle: 'Are you sure?',
                    press: () {});
              },
            ),
      body: const SingleChildScrollView(
        child: BodyCartScreen(),
      ),
    );
  }
}
