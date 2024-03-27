import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initializationStatus;

  AdState(this.initializationStatus);

  String get bannerAdUnitID => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/9214589741" // ANDROID - TEST
      : "ca-app-pub-3940256099942544/2934735716"; // IOS - VALID

  BannerAdListener get adListener => const BannerAdListener();
}
