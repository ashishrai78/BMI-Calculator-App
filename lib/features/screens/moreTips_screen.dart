
import 'package:bmicalculator/features/controller/moreTipsScreen_controller.dart';
import 'package:bmicalculator/googleAds/adMobHelper/Adds_controller/rewarded_Ad.dart';
import 'package:bmicalculator/googleAds/adMobHelper/adMob_helper.dart';
import 'package:bmicalculator/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bmicalculator/common/widgets/text_widget.dart';


class MoreTipsScreen extends StatelessWidget {
  const MoreTipsScreen({super.key,
    required this.exercise,
  });

  final double exercise;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MoreTipsScreenController());
    // call the function for load rewarded Ad1
    RewardedAdController.instance.loadRewardedAd(AdMobHelper.rewardedAdId1);
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff758BFD),
          title: Text('More Tips..',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.34,
                  child: finalAnimation(controller),
                ),

                //----[Indicator]----
                SmoothPageIndicator(
                  controller: controller.pageController,
                  onDotClicked: controller.upDateBySmoothPageIndicator,
                  effect: ExpandingDotsEffect(dotHeight: 5, dotWidth: 5),
                  count: 2,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.greenAccent,
                                blurRadius: 10,
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                UTexts.infoHeadLine,
                                style:
                                GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 20),
                              child: moreTipsDiet(),
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.lightBlueAccent,
                                            blurRadius: 10,
                                          )
                                        ]
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8, bottom: 20),
                                          child: moreTipsExercise(),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: width,
                                              decoration: BoxDecoration(
                                                  color: Colors.orangeAccent,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(25),
                                                      topRight: Radius.circular(25)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.orangeAccent,
                                                      blurRadius: 10,
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 8, bottom: 20),
                                                    child: SingleChildScrollView(
                                                      child: moreTipsAddition(),
                                                    )
                                                  ),
                                                ],
                                              )
                                          ).animate().slideY(begin: 1.0,duration: Duration(seconds: 1)),
                                        )
                                      ],
                                    )
                                ).animate().slideY(begin: 1.0,duration: Duration(milliseconds: 850)),
                            ),
                          ],
                        )
                    ).animate().slideY(begin: 1.0,duration: Duration(milliseconds: 700)))
              ],
            ),
          ),
        ));
  }

  finalAnimation(controller) {
    if (exercise < 18.5) {
      return PageView(
        controller: controller.pageController,
        onPageChanged: controller.upDateByPageScroll,
        children: [
          Lottie.asset('assets/images/pushUp.json'),
          Lottie.asset('assets/images/yogaCobra.json'),
        ],
      );
    } else if(exercise >= 18.5 && exercise <= 24.9){
      return PageView(
        controller: controller.pageController,
        onPageChanged: controller.upDateByPageScroll,
        children: [
          Lottie.asset('assets/images/run.json'),
          Lottie.asset('assets/images/Yoga.json'),
        ],
      );
    } else{
      return PageView(
        controller: controller.pageController,
        onPageChanged: controller.upDateByPageScroll,
        children: [
          Lottie.asset('assets/images/cycling.json'),
          Lottie.asset('assets/images/pawanyoga.json'),
        ],
      );
    }
  }

  moreTipsDiet() {
    if (exercise < 18.5) {
      return TipsTexts(
        infoTitle: UTexts.unInfoTitle,
        infoSubTitle: UTexts.unInfoSubTitle
      );
    } else if(exercise >= 18.5 && exercise <= 24.9){
      return TipsTexts(
        infoTitle: UTexts.healthWeightTitle,
        infoSubTitle: UTexts.healthWeightSubTitle,
      );
    } else{
      return TipsTexts(
        infoTitle: UTexts.ovWeightTitle,
        infoSubTitle: UTexts.ovWeightSubTitle,
      );
    }
  }

  moreTipsExercise() {
    if (exercise < 18.5) {
      return TipsTexts(
          infoTitle: UTexts.exerciseTitle,
          infoSubTitle: UTexts.unExerciseSubTitle
      );
    } else if(exercise >= 18.5 && exercise <=24.9){
      return TipsTexts(
        infoTitle: UTexts.exerciseTitle,
        infoSubTitle: UTexts.healthWeightEx,
      );
    } else{
      return TipsTexts(
        infoTitle: UTexts.exerciseTitle,
        infoSubTitle: UTexts.ovExerciseSubTitle,
      );
    }
  }

  moreTipsAddition() {
    if (exercise < 18.5) {
      return TipsTexts(
          infoTitle: UTexts.additionTips,
          infoSubTitle: UTexts.unAdditionTips,
      );
    } else if(exercise >= 18.5 && exercise <=24.9){
      return TipsTexts(
        infoTitle: UTexts.additionTips,
        infoSubTitle: UTexts.healthWeightAdditionTips,
      );
    } else{
      return TipsTexts(
        infoTitle: UTexts.additionTips,
        infoSubTitle: UTexts.ovWeightAdditionTips,
      );
    }
  }
}

