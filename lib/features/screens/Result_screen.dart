
import 'package:bmicalculator/features/controller/result_controller.dart';
import 'package:bmicalculator/features/screens/moreTips_screen.dart';
import 'package:bmicalculator/googleAds/adMobHelper/Adds_controller/rewarded_Ad.dart';
import 'package:bmicalculator/googleAds/adMobHelper/adMob_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.result, required this.percent1, required this.indicatorColor1});

  final double result;
  final double percent1;
  final Color indicatorColor1;

  final List<Map<String, String>> data = [
    {"bmi": "< 18.5 kg/m²", "category": "Underweight"},
    {"bmi": "18.5–24.9 kg/m²", "category": "Normal weight"},
    {"bmi": "25.0–29.9 kg/m²", "category": "Overweight"},
    {"bmi": "≥30.0 kg/m²", "category": "Obese"},
  ];

  @override
  Widget build(BuildContext context) {
    final resultController = Get.put(ResultController());
    final controller = resultController.get(result);
    // call the function for load rewarded Ad2
    RewardedAdController.instance.loadRewardedAd(AdMobHelper.rewardedAdId2);

    final height = MediaQuery.of(context).size.height*1;
    final width = MediaQuery.of(context).size.width*1;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text('Health',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            actions: [IconButton(
                onPressed:(){
                  Get.to(()=> MoreTipsScreen(exercise: result));
                  // final show the rewarded Ad
                  final showAd = RewardedAdController.instance;
                  if(showAd.adLoaded.value){showAd.showRewardedAd();}
                },
                icon: Icon(Icons.health_and_safety_outlined, color: Colors.orange, size: 30,))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // CircularPercentIndicator
                SizedBox(
                  height: height*0.25,
                  child: Obx(
                      ()=> CircularPercentIndicator(
                        radius: 85,
                        lineWidth: 20,
                        percent: resultController.circularPer.value,
                        animation: true,
                        animationDuration: 2000,
                        progressColor: indicatorColor1,
                        backgroundColor: Colors.blue.shade50,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('BMI is:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Text(result.toStringAsFixed(2),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ],
                        )
                    ),
                  ),
                ),

                SizedBox(height: height*0.04,),

                // LinearPercentIndicator
                Card(
                  color: Colors.white60,
                  elevation: 0,
                  child: Column(
                    children: [
                      LinearPercentIndicator(
                        lineHeight: 30,
                        animation: true,
                        percent: percent1,
                        animationDuration: 1500,
                        barRadius: Radius.circular(10),
                        progressColor: Color(0xff758BFD),
                        backgroundColor: Colors.blueGrey.shade100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('UnderWeight',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow)),
                            Text('Healthy',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                            Text('OverWeight',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: height*0.07,),

                // BMI Chart Table
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Table(
                    border: TableBorder.all(color: Color(0xff758BFD), width: 1),
                    columnWidths: const {
                      0: FlexColumnWidth(1.5),
                      1: FlexColumnWidth(1),
                    },
                    children: [
                      // Header Row
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xff758BFD)),
                        children: const [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "BMI Range",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Weight Category",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Data Rows
                      ...data.map(
                            (item) => TableRow(
                          decoration: BoxDecoration(color: Colors.white60),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  item["bmi"]!,
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  item["category"]!,
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
