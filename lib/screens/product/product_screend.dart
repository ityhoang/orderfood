// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:async';

import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/homes/homes_screen.dart';
import 'package:apporder/screens/product/components/body.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static String routeName = "/product";
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
  }

  List<Product> snapshot = [];
  String name = '';

  Future<void> getName(context) async {
    try {
      final args =
          ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      snapshot = args.snapshot;
      name = args.name;
    } catch (e) {
      Timer.run(() {
        Navigator.pushReplacementNamed(context, HomesScreen.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getName(context);
    return Responsive(
      desktop: Body(snapshot: snapshot, name: name, keys: keys),
      tablet: Body(snapshot: snapshot, name: name, keys: keys),
      mobile: Body(snapshot: snapshot, name: name, keys: keys),
      keys: keys,
    );
  }
}
