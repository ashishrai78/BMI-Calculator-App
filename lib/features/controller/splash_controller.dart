import 'dart:async';
import 'package:bmicalculator/features/screens/Main_screen.dart';
import 'package:bmicalculator/features/screens/userDetails.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    whereToGo();
    super.onInit();
  }

  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();
    var writeInfo = sharedPref.getBool('GetInfo');

    Timer(Duration(seconds: 4),() {
      if(writeInfo !=null){
        if(writeInfo){
          Get.offAll(()=> MainScreen());
        }else{
          Get.offAll(()=> UserDetail());
        }
      }else{
        Get.offAll(()=> UserDetail());
      }
    });
  }
}