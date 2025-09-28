import 'package:get/get.dart';

class ResultController extends GetxController{
  static ResultController get instance => Get.find();

  // Variables
  RxDouble circularPer = 0.0.obs;


  void get (double result) async{
    if(result < 18.5){
      final calculate = (result / 18.5) * 100;
      circularPer.value = 1.0 - (calculate/100);
    }
    if(result > 18.5 && result < 24.9){
      final finalResult = result - 18.5;
      final calculate = (finalResult/6.4) * 100;
      circularPer.value = 1.0 - (calculate/100);
    }
    if(result > 25 && result < 29.9){
      final finalResult = result - 24.9;
      final calculate = (finalResult/5) * 100;
      circularPer.value = 1.0 - (calculate/100);
    }
    if(result > 30.0){
      circularPer.value = 1;
    }
  }
}