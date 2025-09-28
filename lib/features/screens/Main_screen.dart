
import 'package:bmicalculator/features/controller/calculate_controller.dart';
import 'package:bmicalculator/googleAds/adMobHelper/Adds_controller/banner_Ad.dart';
import 'package:bmicalculator/googleAds/adMobHelper/Adds_controller/rewarded_Ad.dart';
import 'package:bmicalculator/googleAds/adMobHelper/adMob_helper.dart';
import 'package:bmicalculator/widgets/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = CalculateController.instance;
    // initialize the banner Ad
    final adController = Get.put(BannerAdController());
    final reloadBannerAd = adController.loadBannerAd(AdMobHelper.bannerAdId);
    // call the function for load rewarded Ad1
    Get.put(RewardedAdController()).loadRewardedAd(AdMobHelper.rewardedAdId1);
    // UI/UX
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff758BFD),
          title: Text('BMI Calculator',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white)
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // show the banner Ad
              SizedBox(height: 3,),
              Obx(
              (){
                if(adController.isAdLoaded.value){
                  return  SizedBox(
                    child: adController.getBannerAdWidget(),
                  );
                }
                return SizedBox();
              }
              ),
              //-----[User Info]----
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 3, right: 3),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE9ECEF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff758BFD),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Name:',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.userName.value.toString()),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Last weight:',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Obx(
                                      ()=> Text(
                                      controller.lastWeight.value.toStringAsFixed(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 20),
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Age:',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Obx(()=> Text(controller.userAge.value.toString())),
                                ],
                              )),
                        ],
                      ),
                    )),
              ),

              //----[For Height Box]----
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: UCardWidget(
                            context: context,
                            text: 'Height',
                            labelText: 'In feet',
                            controller: controller.feController)),
                    Expanded(
                        child: UCardWidget(
                            context: context,
                            text: 'Height',
                            labelText: 'In inch',
                            controller: controller.inController)),
                  ],
                ),
              ),

              //----[For weight Box]----
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Row(
                  children: [
                    Expanded(
                        child: UCardWidget(
                            context: context,
                            text: 'Weight',
                            labelText: 'In kg',
                            controller: controller.wtController)),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),

              //----[All Operation from Click]----
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ElevatedButton(
                    onPressed: () {
                      controller.calculateBmi();
                      // final show the rewarded Ad1
                      final showAd = RewardedAdController.instance;
                      if(showAd.adLoaded.value){showAd.showRewardedAd();}
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 60, right: 60),
                        backgroundColor: Color(0xff758BFD),
                        foregroundColor: Colors.white,
                        shadowColor: Color(0xff758BFD),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'CALCULATE',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
              ),

              //-----[Result]-----
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Obx(
                  (){
                    if(controller.result.value){
                      return Text(
                        'Fill all the current required blanks!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      );
                    }
                    return SizedBox();
                  }
                ),
              ),

              //----[Showing BannerAd]-----

            ],
          ),
        ),
      ),
    );
  }
}
