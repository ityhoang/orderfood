// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:apporder/components/search_tf.dart';
import 'package:apporder/provider/test.dart';
import 'package:apporder/screens/cart/cart_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TopBars extends StatefulWidget {
  final GlobalKey<ScaffoldState> keys;
  const TopBars({Key? key, required this.keys}) : super(key: key);

  @override
  _TopBarsState createState() => _TopBarsState();
}

class _TopBarsState extends State<TopBars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    widget.keys.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 20.0,
                    color: Colors.indigo[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Badge(
                          padding: EdgeInsets.all(3.5),
                          badgeContent: Consumer<Test>(
                            builder: (context, value, child) {
                              return value.getCount() > 9
                                  ? Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: "9",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                        TextSpan(
                                            text: "+",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8)),
                                      ]),
                                    )
                                  : Text(value.getCount().toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12));
                            },
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(
                                    context, CartScreen.routeName);
                              });
                            },
                            child: Icon(
                              MdiIcons.cart,
                              color: Colors.indigo[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    child: InkWell(
                      onTap: () async {
                        await showSearch<String>(
                          context: context,
                          delegate: CustomDelegate(),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.indigo[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
