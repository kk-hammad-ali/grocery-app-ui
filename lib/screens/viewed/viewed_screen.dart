import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/viewed/components/body.dart';

class ViewedScreen extends StatelessWidget {
  static String routeName = "/viewed";
  const ViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(
          context: context,
          text: 'History',
          isLeading: true,
          isSuffix: true,
          suffixPress: () async {
            await CommonFunction.warningDialog(
                context: context,
                text: "Clear History",
                subTitle: "Are you sure?");
          }),
      body: const BodyViewedScreen(),
    );
  }
}
