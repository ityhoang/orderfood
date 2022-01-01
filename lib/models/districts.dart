import 'dart:convert';

import 'package:apporder/models/wards.dart';

class Districts {
  final String name;
  final num code;
  final String codename;
  final String division_type;
  final String short_codename;
  final List<Wards> wards;
  Districts({
    required this.name,
    required this.code,
    required this.codename,
    required this.division_type,
    required this.short_codename,
    required this.wards,
  });
  factory Districts.fromJson(Map<String, dynamic> jsonData) {
    return Districts(
      name: jsonData['name'],
      code: jsonData['code'],
      codename: jsonData['codename'],
      division_type: jsonData['division_type'],
      short_codename: jsonData['short_codename'],
      wards: (jsonData['wards'] as List<dynamic>)
          .map<Wards>((e) => Wards.fromJson(e))
          .toList(),
    );
  }
  static Map<String, dynamic> toMap(Districts card) => {
        'name': card.name,
        'code': card.code,
        'codename': card.codename,
        'division_type': card.division_type,
        'short_codename': card.short_codename,
        'wards': card.wards,
      };

  static String encode(List<Districts> card) => json.encode(
        card
            .map<Map<String, dynamic>>((card) => Districts.toMap(card))
            .toList(),
      );

  static List<Districts> decode(String card) =>
      (json.decode(card) as List<dynamic>)
          .map<Districts>((item) => Districts.fromJson(item))
          .toList();
}
