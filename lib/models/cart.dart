// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

class CartModel {
  final String image;
  final num price;
  var quantity;
  var size;
  final String name;
  final String id;
  CartModel({
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.name,
    required this.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      image: jsonData['image'],
      price: jsonData['price'],
      quantity: jsonData['quantity'],
      size: jsonData['size'],
      name: jsonData['name'],
      id: jsonData['id'],
    );
  }
  static Map<String, dynamic> toMap(CartModel card) => {
        'image': card.image,
        'price': card.price,
        'quantity': card.quantity,
        'size': card.size,
        'name': card.name,
        'id': card.id,
      };

  static String encode(List<CartModel> card) => json.encode(
        card
            .map<Map<String, dynamic>>((card) => CartModel.toMap(card))
            .toList(),
      );

  static List<CartModel> decode(String card) =>
      (json.decode(card) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
