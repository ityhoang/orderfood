// class TestModel {
//   late String productName;
//   late String productAge;

//   TestModel({
//     required this.productName,
//     required this.productAge,
//   });
//   factory TestModel.fromJson(Map<String, dynamic> jsonData) {
//     return TestModel(
//       productName: jsonData['tyhoang'],
//       productAge: jsonData['tyhoang1'],
//     );
//   }
// }
import 'package:flutter/material.dart';

class test {
  late final GlobalKey<ScaffoldState> keys;
  test({
    required this.keys,
  });
}
