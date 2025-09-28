import 'package:bmicalculator/features/screens/Main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsController extends GetxController{
  static UserDetailsController get instance => Get.find();

  // Variables
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController ageControl = TextEditingController();


  // Store UserDetails
  Future<void> saveData(nameControl, ageControl) async {
    final userData = await SharedPreferences.getInstance();
    userData.setString('name', nameControl.text);
    userData.setString('age', ageControl.text);
    userData.setBool('GetInfo', true);

    Get.offAll(()=> MainScreen());
  }
}