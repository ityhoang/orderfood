import 'dart:convert';

class Wards {
  final String name;
  final num code;
  final String codename;
  final String division_type;
  final String short_codename;
  Wards({
    required this.name,
    required this.code,
    required this.codename,
    required this.division_type,
    required this.short_codename,
  });
  factory Wards.fromJson(Map<String, dynamic> jsonData) {
    return Wards(
      name: jsonData['name'],
      code: jsonData['code'],
      codename: jsonData['codename'],
      division_type: jsonData['division_type'],
      short_codename: jsonData['short_codename'],
    );
  }
  static Map<String, dynamic> toMap(Wards card) => {
        'name': card.name,
        'code': card.code,
        'codename': card.codename,
        'division_type': card.division_type,
        'short_codename': card.short_codename,
      };

  static String encode(List<Wards> card) => json.encode(
        card.map<Map<String, dynamic>>((card) => Wards.toMap(card)).toList(),
      );

  static List<Wards> decode(String card) => (json.decode(card) as List<dynamic>)
      .map<Wards>((item) => Wards.fromJson(item))
      .toList();
}
