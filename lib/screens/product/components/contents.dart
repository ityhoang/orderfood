// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:apporder/models/product.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/homes/components/loca.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class Contents extends StatefulWidget {
  final List<Product>? snapshot;
  final String? name;
  const Contents({Key? key, this.snapshot, this.name}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 140.0 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 500,
            child: ScrollableListTabView(
              tabHeight: 48,
              bodyAnimationDuration: const Duration(milliseconds: 150),
              tabAnimationCurve: Curves.easeOut,
              tabAnimationDuration: const Duration(milliseconds: 200),
              tabs: [
                ScrollableListTab(
                  tab: ListTab(
                      label: Text("${widget.name}"),
                      icon: Icon(Icons.group),
                      showIconOnList: false),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: widget.snapshot!
                              .map(
                                (e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e),
                                ),
                              )
                              .toList(),

                          // [

                          //   for (var location in locations)
                          //     SizedBox(
                          //         width: 270,
                          //         height: 300,
                          //         child: LocationWidget(location: location)),
                          // ],
                        ),
                      )
                    ],
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

// https://tamnguyen.com.vn/thiet-ke-website-do-an-vie-food.html
