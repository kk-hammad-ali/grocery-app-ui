import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/details/components/bottom_container.dart';
import 'package:grocery/screens/details/components/quantity_controller_details.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            dimensions.getScreenW(40),
          ),
          topRight: Radius.circular(
            dimensions.getScreenW(40),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
            child: Row(
              children: [
                TextWidget(
                  text: 'Title',
                  color: color,
                  textSize: dimensions.getScreenW(25),
                  isTitle: true,
                ),
                const Spacer(),
                HeartWidget(
                  color: color,
                  size: dimensions.getScreenW(20),
                  press: () {},
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: dimensions.getScreenH(100),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
              child: Row(
                children: [
                  TextWidget(
                    text: '\$2.59',
                    color: Colors.green,
                    textSize: dimensions.getScreenW(25),
                    isTitle: true,
                  ),
                  TextWidget(
                    text: '/Kg',
                    color: color,
                    textSize: dimensions.getScreenW(15),
                    isTitle: false,
                  ),
                  SizedBox(
                    width: dimensions.getScreenW(10),
                  ),
                  Visibility(
                    visible: true,
                    child: Text(
                      '\$3.9',
                      style: TextStyle(
                        fontSize: dimensions.getScreenW(20),
                        color: color,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GreenButtonWidget(
                    text: 'Free Delivery',
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
          const QuantityControllerDetails(),
          const Spacer(),
          const BottomContainer(),
        ],
      ),
    );
  }
}
