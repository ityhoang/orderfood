// ignore_for_file: await_only_futures

import 'dart:convert';

import 'package:apporder/models/cart.dart';
import 'package:apporder/models/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Test with ChangeNotifier {
//   String name = "tyhoang";
//   List<TestModel> wishList = [];

//   void getWishtListData() async {
//     List<TestModel> newList = [];
//     final value = await FirebaseDatabase.instance.reference().child("test");

//     await value.reference().once().then(
//       (result) {
//         final value = result.value;
//         value.forEach(
//           (key, value) {
//             TestModel testModel =
//                 TestModel(productName: value["name"], productAge: value["age"]);
//             newList.add(testModel);
//           },
//         );
//       },
//     );
//     wishList = newList;
//     // print("tyhoang");
//     notifyListeners();
//   }

//   List<TestModel> get getWishList {
//     return wishList;
//   }
// }
class Test with ChangeNotifier {
  num _count = 0;
  num _counts = 0;
  num get count => _count;
  List<CartModel> myList = [];
  void addCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _count++;
    prefs.setInt("count", _count.toInt());
    notifyListeners();
  }

  void removeCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_count > 1) {
      _count--;
      prefs.setInt("count", _count.toInt());
    }
    notifyListeners();
  }

  void removeCounts(num count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_count > 0) {
      _count -= count;
      if (_count <= 0) {
        _count = 0;
      }
      prefs.setInt("count", _count.toInt());
    }
    notifyListeners();
  }

  void addCounts(num count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _count += count;
    prefs.setInt("count", _count.toInt());
    notifyListeners();
  }

  num getCount() {
    getList();
    return _count = _counts;
  }

  void getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counts = prefs.getInt('count') ?? 0;
    notifyListeners();
  }
}
