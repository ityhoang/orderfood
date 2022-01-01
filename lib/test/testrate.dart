// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';

import 'package:apporder/responsive/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var check = [2, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  int? check1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          if (Responsive.getSize(context).height <= 50)
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.amber,
              ),
            )
          else
            Container(
              width: Responsive.getSize(context).width,
              height: 60,
              color: Colors.amber,
            ),
          Expanded(
            flex: 11,
            child: Container(
              width: Responsive.getSize(context).width,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                    },
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: Responsive.getSize(context).width * 0.4,
                            height: Responsive.getSize(context).height * 6 / 12,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            child: buildRate(id: index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRate({required int id}) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  check[id] = index;
                  check1 = id;
                });
              },
              child: (index <= check[id])
                  ? Icon(
                      FontAwesomeIcons.star,
                      color: Colors.red,
                    )
                  : Icon(FontAwesomeIcons.star),
            ),
          ),
        ],
      );
}





// child: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(
//           dragDevices: {
//             PointerDeviceKind.mouse,
//             PointerDeviceKind.touch,
//           },
//         ),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 40,
//           itemBuilder: (BuildContext context, int index) {
//             return FlutterLogo(style: FlutterLogoStyle.horizontal, size: 300);
//           },
//         ),
//       ),