import 'package:bmicalculator/features/screens/Result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculateController extends GetxController{
  static CalculateController get instance => Get.find();

  // Variables
  RxString userName = ''.obs;
  RxString userAge = ''.obs;

  final wtController = TextEditingController();
  final feController = TextEditingController();
  final inController = TextEditingController();

  RxBool result = false.obs;
  RxDouble lastWeight = 0.0.obs;

  double percent1 = 0.0;
  Color indicatorColor1 = Colors.grey;


  // on init
  @override
  void onInit() {
   getUserDetails();
    super.onInit();
  }

  @override
  void onReady() {
    getUserDetails();
    super.onReady();
  }


  // function for calculate BMI
  void calculateBmi(){
    var feet = feController.text.toString();
    var inch = inController.text.toString();
    var weight = wtController.text.toString();

    if (feet != '' && inch != '' && weight != '') {

      double iFeet = double.parse(feet);
      double iInch = double.parse(inch);
      double iWeight = double.parse(weight);

      var tInch = (iFeet * 12) + iInch;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;

      var bmi = iWeight / (tM * tM);

      result.value = false;

      // store last weight
      saveLastWeight(bmi);

      if (bmi < 18.5) {
        //double percent = 0.4;
        percent1 = 0.2;
        indicatorColor1 = Colors.yellow;
      } else {
        if (bmi > 18.5 && bmi < 24.9) {
          percent1 = 0.58;
          indicatorColor1 = Colors.green;
        }
      }
      if (bmi > 25) {
        percent1 = 0.95;
        indicatorColor1 = Colors.red;
      }


      // navigate to result Screen
      Get.to(()=> ResultScreen(result: bmi, percent1: percent1, indicatorColor1: indicatorColor1));

    } else {
        result.value = true;
    }
  }



  // function for Store lastWeight
  Future<void> saveLastWeight(double lastCalculate) async {
    final userData = await SharedPreferences.getInstance();
    userData.setDouble('lastWeight', lastCalculate);
    lastWeight.value = userData.getDouble('lastWeight')!;
  }



  Future<void> getUserDetails() async {
    final userData = await SharedPreferences.getInstance();
    userName.value = userData.getString('name')!;
    userAge.value = userData.getString('age')!;
    lastWeight.value = userData.getDouble('lastWeight')!;
  }

}