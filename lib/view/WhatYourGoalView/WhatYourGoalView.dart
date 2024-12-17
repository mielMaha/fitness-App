import 'package:fitness/view/login/login_view.dart';
import 'package:fitness/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  PageController pageController = PageController(viewportFraction: 0.7);
  int currentIndex = 0;

  List goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            // PageView
            Center(
              child: SizedBox(
                width: media.width,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: goalArr.length,
                  itemBuilder: (context, index) {
                    var gObj = goalArr[index];
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 85, horizontal: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: media.width * 0.1, horizontal: 10),
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  gObj["image"].toString(),
                                  width: media.width,
                                  fit: BoxFit.cover,
                                ),
                                // SizedBox(
                                //   height: media.width * 0.05,
                                // ),
                                Text(
                                  gObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width: media.width * 0.1,
                                  height: 1,
                                  color: TColor.white,
                                ),
                                SizedBox(
                                  height: media.width * 0.02,
                                ),
                                Text(
                                  gObj["subtitle"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            // Text and Confirm Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "What is your goal ?",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "It will help us to choose a best\nprogram for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  // Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      goalArr.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 12 : 8,
                        height: currentIndex == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              currentIndex == index ? Colors.blue : TColor.gray,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                      title: "Confirm",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
