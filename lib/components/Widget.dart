import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek/extensions/Colors.dart';
import 'package:gojek/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

Widget Vertical_large = 60.height;
Widget Vertical_medium = 40.height;
Widget Vertical_small = 16.height;

Widget Loading(){
  return  Center(
    child: Image.asset(img_loader,
        color: jcbDarkColor, width: 50, height: 50),
  );
}

Widget jcbBackWidget(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios, color:  jcbDarkColor),
    onPressed: () {
      finish(context);
    },
  );
}