import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdController extends GetxController{
  static RewardedAdController get instance => Get.find();

  // Variables
  RewardedAd? _rewardedAd;
  RxBool adLoaded = false.obs;


  // Load to RewardedAd
  void loadRewardedAd(String rewardAd){
    RewardedAd.load(
        adUnitId: rewardAd,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
             _rewardedAd = ad;
             adLoaded.value = true;
            },
            onAdFailedToLoad: (LoadAdError error){
              loadRewardedAd(rewardAd);
            }
        )
    );
  }

  // Show RewardedAd
  void showRewardedAd(){
      _rewardedAd?.show(
        onUserEarnedReward:
            (AdWithoutView ad, RewardItem rewardItem) {
          debugPrint(
            'Reward amount: ${rewardItem.amount}',
          );
        },
      );

      _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          debugPrint('Ad showed full screen content.');
        },
        onAdFailedToShowFullScreenContent: (ad, err) {
          debugPrint('Ad failed to show full screen content with error: $err');
          ad.dispose();
        },
        onAdDismissedFullScreenContent: (ad) {
          debugPrint('Ad was dismissed.');
          ad.dispose();
        },
        onAdImpression: (ad) {
          debugPrint('Ad recorded an impression.');
        },
        onAdClicked: (ad) {
          debugPrint('Ad was clicked.');
        },
      );

      adLoaded.value = false;
  }
}