// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gojek/components/JCBFormTextField.dart';
import 'package:gojek/components/Widget.dart';
import 'package:gojek/extensions/Colors.dart';
import 'package:gojek/screens/SignUpScreen.dart';
import 'package:gojek/screens/HomeScreen.dart';
import 'package:gojek/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        actions: [
          Text('Sign Up', style: boldTextStyle(color: jcbPrimaryColor))
              .center()
              .paddingSymmetric(horizontal: 16)
              .onTap(() {
            finish(context);
            SignUpScreen().launch(context);
            // SignUpScreen().launch(context);
          },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Log in',
                style: boldTextStyle(
                    size: 40, color: jcbDarkColor, weight: FontWeight.w900)),
            30.height,
            JCBFormTextField(
              autoFocus: false,
              controller: emailCont,
              focus: email,
              nextFocus: password,
              label: 'Email',
              textFieldType: TextFieldType.EMAIL,
            ),
            16.height,
            JCBFormTextField(
              controller: passwordCont,
              focus: password,
              textInputAction: TextInputAction.done,
              label: 'Password',
              textFieldType: TextFieldType.PASSWORD,
            ),
            16.height,
            Text('Forget Password',
                style: boldTextStyle(color: jcbPrimaryColor, size: 14)),
            80.height,
            AppButton(
              width: context.width() - 32,
              onTap: () {
                if (emailCont.text.length < 5 || passwordCont.text.length < 5) {
                  toast(
                      'Email and password must be at least 5 characters long');
                } else {
                  finish(context);
                  HomeScreen().launch(context);
                };
              },
              color: jcbPrimaryColor,
              elevation: 0,
              shapeBorder:
                  RoundedRectangleBorder(borderRadius: radius(gjkButtonRadius)),
              child: Text('Log in'.toUpperCase(),
                  style: boldTextStyle(color: Colors.white)),
            ),
            80.height,
            Text('Or connect using social account',
                style: secondaryTextStyle(color: context.iconColor, size: 12)),
            16.height,
            AppButton(
              padding: EdgeInsets.all(0),
              width: context.width() - 32,
              onTap: () {},
              color: Color(0xFF4267B2),
              shapeBorder:
                  RoundedRectangleBorder(borderRadius: radius(gjkButtonRadius)),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/gojek/fb_logo.png',
                      height: 50, width: 50, fit: BoxFit.cover),
                  Text('Connect with Facebook',
                      style: boldTextStyle(color: Colors.white)),
                  SizedBox(width: 5),
                ],
              ),
            ),
            16.height,
            AppButton(
              width: context.width() - 32,
              onTap: () {},
              color: context.scaffoldBackgroundColor,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: radius(gjkButtonRadius),
                  side: BorderSide(color: jcbPrimaryColor)),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.call, color: jcbPrimaryColor),
                  Text('Connect with Phone number',
                      style: boldTextStyle(color: jcbPrimaryColor)),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
