import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untitled1/Utils/dart_classes/firebase_compatibility_class.dart';
import 'package:untitled1/Utils/dart_classes/firebase_details_class.dart';
import 'package:untitled1/database/database_util.dart';


import '../Utils/dart_classes/home_page_content_class.dart';

part 'firebase_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FireBaseDetails> fetchDetails(FetchDetailsRef ref,
        {required int sign, required int day}) async =>
    DatabaseUtil.fetchDetails(sign, day);

@riverpod
Future<FireBaseCompatibility> fetchCompatibility(
        FetchCompatibilityRef ref,
        {required int firstSign,
        required int secondSign}) async =>
    DatabaseUtil.fetchCompatibility(firstSign, secondSign);

@Riverpod(keepAlive: true)
Future<HomePageContent> fetchHomePageContent(FetchHomePageContentRef ref,
        {required int sign, required int day}) async =>
    DatabaseUtil.fetchHomePageContent(sign, day);
