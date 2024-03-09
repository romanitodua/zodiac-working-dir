import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_state.dart';

final adStateProvider = Provider((ref) => AdState(MobileAds.instance.initialize()));
