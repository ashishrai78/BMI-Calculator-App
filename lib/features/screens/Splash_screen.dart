
import 'package:bmicalculator/features/controller/calculate_controller.dart';
import 'package:bmicalculator/features/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    Get.put(CalculateController());
    return Container(
      color: Colors.blueAccent,
      child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*3,
            height: MediaQuery.of(context).size.height*3,
          child: Lottie.asset('assets/images/splashLotties.json'))),
    );
  }
}

