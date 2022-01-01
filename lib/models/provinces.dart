import 'dart:convert';

import 'package:apporder/models/districts.dart';

class Provinces {
  final String name;
  final num code;
  final String codename;
  final String division_type;
  final num phone_code;
  final List<Districts> districts;
  Provinces({
    required this.name,
    required this.code,
    required this.codename,
    required this.division_type,
    required this.phone_code,
    required this.districts,
  });

  factory Provinces.fromJson(Map<String, dynamic> jsonData) {
    return Provinces(
      name: jsonData['name'],
      code: jsonData['code'],
      codename: jsonData['codename'],
      division_type: jsonData['division_type'],
      phone_code: jsonData['phone_code'],
      districts: (jsonData['districts'] as List<dynamic>)
          .map<Districts>((e) => Districts.fromJson(e))
          .toList(),
    );
  }
  static Map<String, dynamic> toMap(Provinces card) => {
        'name': card.name,
        'code': card.code,
        'codename': card.codename,
        'division_type': card.division_type,
        'phone_code': card.phone_code,
        'districts': card.districts,
      };

  static String encode(List<Provinces> card) => json.encode(
        card
            .map<Map<String, dynamic>>((card) => Provinces.toMap(card))
            .toList(),
      );

  static List<Provinces> decode(String card) =>
      (json.decode(card) as List<dynamic>)
          .map<Provinces>((item) => Provinces.fromJson(item))
          .toList();
}
