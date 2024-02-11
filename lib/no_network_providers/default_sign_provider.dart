import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'default_sign_provider.g.dart';

@riverpod
class DefaultSign extends _$DefaultSign {
  late SharedPreferences prefs;

  DefaultSign() : super();

  @override
  int build() {
    _init();
    return -1;
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var defaultSign = prefs.getInt("sign");
    state = defaultSign ?? -1;
  }

  void setSign(int sign) async {
    state = sign;
    prefs.setInt("sign", sign);
  }
}
