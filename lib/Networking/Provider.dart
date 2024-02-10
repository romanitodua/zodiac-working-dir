import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Utils/compatibility_result.dart';
import '../Utils/sign_infromation.dart';

part 'Provider.g.dart';

@Riverpod(keepAlive: true)
Future<SignInformation> fetchDetails(FetchDetailsRef ref,
    {required int sign, required int day}) async {
  final response = await http.get(Uri.parse(
      'https://zodiacapp.pythonanywhere.com/details/?sign=$sign&?day=$day'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return SignInformation.fromJson(json);
}

@riverpod
Future<CompatibilityResult> fetchCompatibility(FetchCompatibilityRef ref,
    {required int firstSign, required int secondSign}) async {
  final response = await http.get(Uri.parse(
      'https://zodiacapp.pythonanywhere.com/compatibility/?f_sign=$firstSign&?s_sign=$secondSign'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return CompatibilityResult.fromJson(json);
}
