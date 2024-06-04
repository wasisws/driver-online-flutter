import 'package:flutter/material.dart';
import 'package:gojek/screens/WelcomeScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:gojek/components/Widget.dart';
import 'package:gojek/extensions/Colors.dart';
import 'package:gojek/extensions/Styles.dart';
import 'package:gojek/utils/Constants.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModelClass> walkThroughList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    walkThroughList.add(WalkThroughModelClass(
      title: 'Request a Ride',
      subTitle: 'Request a ride get picked up by a \nnearby community driver',
      image: img_walkthrough1,
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Vehicle Selection',
      subTitle:
          'Users have the liberty to choose the \ntype of vehicles as per their need.',
      image: img_walkthrough2,
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Live Ride Tracking',
      subTitle:
          'Know your driver in advance and be \nable to view current location in real \ntime on the map',
      image: img_walkthrough3,
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Trip Sharing',
      subTitle:
          'Passengers can share their ride details with family and friends for safety reasons.',
      image: img_walkthrough4,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: context.height() * 0.9,
            child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                children: walkThroughList.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(e.title.validate(), style: HeaderStyle())
                          .paddingSymmetric(horizontal: 24),
                      Vertical_small,
                      Text(
                        e.subTitle.validate(),
                        style: bodyStyle(),
                      ).paddingSymmetric(horizontal: 24),
                      Image.asset(
                        e.image.validate(),
                        width: context.width(),
                        height: context.height() * 0.7,
                        fit: BoxFit.cover,
                      )
                    ],
                  );
                }).toList()),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: context.height() * 0.1,
            color: jcbDarkColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Skip").textColor(Colors.white).onTap(() {
                  //action
                  setValue(IS_FIRST_TIME, false);
                  WelcomeScreen().launch(context);
                }),
                DotIndicator(
                  pageController: pageController,
                  pages: walkThroughList,
                  unselectedIndicatorColor: Colors.grey.withOpacity(0.5),
                ),
                Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Text(currentPage == 3 ? "FINISH" : "NEXT")
                            .textColor(Colors.white))
                    .decorated(
                  color: jcbSecondaryColor,
                  borderRadius: BorderRadius.circular(30),
                )
                    .onTap(() {
                  if (currentPage == 3) {
                    //action
                    setValue(IS_FIRST_TIME, false);
                    WelcomeScreen().launch(context);
                  } else {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
