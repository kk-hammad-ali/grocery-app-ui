import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/forget/forget_password_screen.dart';
import 'package:grocery/screens/signin/component/text_fields_signin.dart';
import 'package:grocery/screens/signup/signup_screen.dart';
import 'package:grocery/widgets/button_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class BodySignInScreen extends StatelessWidget {
  const BodySignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: dimensions.getScreenH(100),
          ),
          TextWidget(
            text: 'WELCOME BACK',
            color: color,
            textSize: dimensions.getScreenW(30),
            isTitle: true,
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          TextWidget(
            text: 'Sigin to continue',
            color: color,
            textSize: dimensions.getScreenW(20),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          const TextFieldSignin(),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                CommonFunction.navigateToPage(context: context, routeName: ForgetPasswordScreen.routeName);
              },
              child: Text(
                'Forget Password?',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: dimensions.getScreenW(18),
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          ButtonWidget(
            buttonText: 'Sign In',
            press: () {},
            isIcon: false,
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          ButtonWidget(isIcon: true, press: () {}),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              SizedBox(
                width: dimensions.getScreenW(10),
              ),
              TextWidget(
                  text: 'OR',
                  color: Colors.black,
                  textSize: dimensions.getScreenW(20)),
              SizedBox(
                width: dimensions.getScreenW(10),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          ButtonWidget(
            buttonText: 'Continue as Guest',
            press: () {},
            isIcon: false,
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: dimensions.getScreenW(18),
              ),
              children: [
                TextSpan(
                    text: " Sign Up",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: dimensions.getScreenW(20),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        CommonFunction.navigateToPage(
                            context: context,
                            routeName: SignUpScreen.routeName);
                      })
              ],
            ),
          )
        ],
      ),
    );
  }
}
