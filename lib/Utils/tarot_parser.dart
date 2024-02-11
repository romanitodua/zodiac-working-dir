import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/Utils/dart_classes/tarot_class.dart';

Tarot parseTarot(String responseBody) {
  final json = jsonDecode(responseBody);
  final parsed = Tarot.fromJson(json);

  return parsed;
}

Future<Tarot> fetch() async {
  String response = await rootBundle.loadString('assets/card_data.json');
  return compute(parseTarot, response);
}
