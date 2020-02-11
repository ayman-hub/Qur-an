import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AdsType { BANNER_ADS, INTERSTITIAL_ADS }
//firebase_admob: ^0.5.0
class CreateAds {
  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-5171359912881640/8428906121'
            : 'ca-app-pub-5171359912881640/2486314303',
        size: AdSize.smartBanner,
        // targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print('mobile event : $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return new InterstitialAd(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-5171359912881640/5748091837'
            : 'ca-app-pub-5171359912881640/9379025714',
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event : $event");
        });
  }

  addAds(AdsType type) {
    FirebaseAdMob.instance.initialize(
        appId: Platform.isAndroid
            ? 'ca-app-pub-5171359912881640/5748091837'
            : 'ca-app-pub-5171359912881640~1364804327');
    if (type == AdsType.BANNER_ADS) {
      _bannerAd = createBannerAd()
        // typically this happens well before the ad is shown
        ..load()
        ..show(
          // Positions the banner ad 60 pixels from the bottom of the screen
          // ? anchorOffset: 60.0,
          // Positions the banner ad 10 pixels from the center of the screen to the right
          // ? horizontalCenterOffset: 10.0,
          // Banner Position
          anchorType: AnchorType.bottom,
        );
    } else if (type == AdsType.INTERSTITIAL_ADS) {
      createInterstitialAd()
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
        );
    }
  }

  adsDiposed() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
  }
}
