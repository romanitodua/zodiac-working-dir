import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/ZodiacDetailProvider.dart';


part 'Provider.g.dart';

@riverpod
Future<ZodiacDetailProvider> fetchDetails(FetchDetailsRef ref) async {
  final response = await http.get(Uri.parse("https://zodiacapp.pythonanywhere.com/blogs/"));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  print("called");
  print(json);
  return ZodiacDetailProvider.fromJson(json);
}



