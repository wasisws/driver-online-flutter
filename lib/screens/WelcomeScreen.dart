import 'package:flutter/material.dart';
import 'package:gojek/components/Widget.dart';
import 'package:gojek/extensions/Colors.dart';
import 'package:gojek/extensions/Styles.dart';
import 'package:gojek/screens/LoginScreen.dart';
import 'package:gojek/screens/SignUpScreen.dart';
import 'package:gojek/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: SizedBox(
        height: context.height(),
        child: Stack(
          children: [
            Positioned(
              bottom: context.height() * 0.15,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: context.statusBarHeight + 50),
                    Image.asset('assets/images/icon.png',
                        height: 100, width: 110, fit: BoxFit.cover),
                        Vertical_small,
                    Text('GOJEK', style: HeaderStyle()),
                     Vertical_small,
                    Image.asset(
                      'assets/images/gojek/gjk_welcom_image.png',
                      width: context.width(),
                      height: context.height() * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: context.height() * 0.15,
                color: jcbImageColor,
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: context.width() / 2 - 24,
                      decoration: BoxDecoration(
                          borderRadius: radius(gjkButtonRadius),
                          color: Colors.white),
                      child: Text('Sign up',
                          style:
                              boldTextStyle(color: jcbPrimaryColor, size: 20),
                          textAlign: TextAlign.center),
                    
                    ).onTap((){
                      SignUpScreen().launch(context);
                    }),
                    Container(
                      margin: EdgeInsets.only(right: 16, top: 20, bottom: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: context.width() / 2 - 24,
                      decoration: BoxDecoration(
                        borderRadius: radius(gjkButtonRadius),
                        color: jcbImageColor,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text('Log in',
                          style: boldTextStyle(color: Colors.white, size: 20),
                          textAlign: TextAlign.center),
                    ).onTap((){
                      LoginScreen().launch(context);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}