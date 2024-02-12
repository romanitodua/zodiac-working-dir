import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untitled1/Utils/data_caching.dart';

part 'default_sign_provider.g.dart';

@Riverpod(keepAlive: true)
class DefaultSign extends _$DefaultSign {
  DefaultSign() : super();

  @override
  int build() {
    return LocalStorage.preferences.getInt("sign") ?? -1;
  }

  void setSign(int sign) async {
    state = sign;
    LocalStorage.preferences.setInt("sign", sign);
  }
}
