import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/Utils/dart_classes/firebase_compatibility_class.dart';
import 'package:untitled1/Utils/dart_classes/firebase_details_class.dart';
import 'package:untitled1/Utils/dart_classes/home_page_content_class.dart';

class DatabaseUtil {
  FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<void> addCompatibility() async {
    final CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('compatibility');

    var s = await rootBundle.loadString('assets/zodiac_compatibility.json');

    var json = jsonDecode(s);
    json.forEach((key, value) {
      value.forEach(
          (e) => collectionReference.doc(key).set(e, SetOptions(merge: true)));
    });
  }

  static Future<void> addDetails() async {
    final CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('details');

    var s = await rootBundle.loadString('assets/zodiac_details.json');

    var json = jsonDecode(s);
    json.forEach((key, value) {
      value.forEach(
          (e) => collectionReference.doc(key).set(e, SetOptions(merge: false)));
    });
  }

  static Future<void> addHomePageContent() async {
    final CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('home_page_content');

    var s = await rootBundle.loadString('assets/zodiac_home_page.json');
    var json = jsonDecode(s);
    json.forEach((key, value) {
      value.forEach(
          (e) => collectionReference.doc(key).set(e, SetOptions(merge: true)));
    });
  }

  static Future<HomePageContent> fetchHomePageContent(int sign, int day) async {
    final CollectionReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('home_page_content');

    HomePageContent homePageContent = await documentReference
        .doc(sign.toString())
        .get()
        .then(
            (value) => HomePageContent.fromFireBase(value.get(day.toString())))
        .catchError((error) => HomePageContent.fromError());

    return homePageContent;
  }

  static Future<FireBaseDetails> fetchDetails(int sign, int day) async {
    final CollectionReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('details');

    FireBaseDetails fireBaseDetails = await documentReference
        .doc(sign.toString())
        .get()
        .then(
            (value) => FireBaseDetails.fromFireBase(value.get(day.toString())))
        .catchError((error) => FireBaseDetails.fromError());

    return fireBaseDetails;
  }

  static Future<FireBaseCompatibility> fetchCompatibility(
      int firstSign, int secondSign) async {
    if (firstSign > secondSign) {
      firstSign = secondSign;
      secondSign = firstSign;
    }

    final CollectionReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('compatibility');

    FireBaseCompatibility fireBaseCompatibility = await documentReference
        .doc(firstSign.toString())
        .get()
        .then((value) => FireBaseCompatibility.fromFireBase(
            value.get(secondSign.toString())))
        .catchError((error) => FireBaseCompatibility.fromError());

    return fireBaseCompatibility;
  }
}
