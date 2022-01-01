import 'package:apporder/models/product.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final List<Product> snapshot;
  final String name;
  ScreenArguments({required this.snapshot, required this.name});
}

class DetailArguments {
  final Product snapshot;
  DetailArguments({required this.snapshot});
}

class ShareKeys {
  late GlobalKey<ScaffoldState> keys;
  ShareKeys({required this.keys});
}
