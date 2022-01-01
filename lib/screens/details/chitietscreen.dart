import 'dart:async';

import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/details/components/body.dart';
import 'package:apporder/screens/homes/homes_screen.dart';
import 'package:flutter/material.dart';

class ChitietScreen extends StatefulWidget {
  const ChitietScreen({Key? key}) : super(key: key);
  static String routeName = "/details";
  @override
  _ChitietScreenState createState() => _ChitietScreenState();
}

class _ChitietScreenState extends State<ChitietScreen> {
  GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
  }

  var snapshot = Product(
      image: [],
      name: '',
      price: 0,
      numlike: 0,
      like: 0,
      content: '',
      id: '',
      catoname: '');

  Future<void> getName(context) async {
    try {
      final args =
          ModalRoute.of(context)!.settings.arguments as DetailArguments;
      snapshot = args.snapshot;
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
      desktop: Body(snapshot: snapshot, keys: keys),
      tablet: Body(snapshot: snapshot, keys: keys),
      mobile: Body(snapshot: snapshot, keys: keys),
      keys: keys,
    );
  }
}
