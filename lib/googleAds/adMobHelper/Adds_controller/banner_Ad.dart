import 'package:bmicalculator/googleAds/adMobHelper/adMob_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdController extends GetxController{
  static BannerAdController get instance => Get.find();

  // Variables
  BannerAd? _bannerAd;
  final RxBool isAdLoaded = false.obs;


  // onInit
  // dispose
  @override
  void onClose() {
    disposeAd();
    super.onClose();
  }




  Future<void> loadBannerAd(String bannerAd) async{
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAd,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            isAdLoaded.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            isAdLoaded.value = false;
          }
      ),
    )..load();
  }

   getBannerAdWidget(){
    if(isAdLoaded.value && _bannerAd!= null){
      return SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
  }

  void disposeAd(){
    _bannerAd?.dispose();
    isAdLoaded.value = false;
  }

}