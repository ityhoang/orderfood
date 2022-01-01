// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var extraLargeScreenGrid = currentWidth > 1536;
    var largeScreenGrid = currentWidth > 1366;
    var smallScreenGrid = currentWidth > 1201;
    var tabScreenGrid = currentWidth > 769;

    return Container(
      padding: EdgeInsets.only(
          left: largeScreenGrid
              ? 50.0
              : smallScreenGrid
                  ? 40.0
                  : tabScreenGrid
                      ? 10.0
                      : 10.0,
          top: 50.0,
          right: largeScreenGrid
              ? 100.0
              : smallScreenGrid
                  ? 40.0
                  : tabScreenGrid
                      ? 10.0
                      : 10.0,
          bottom: 20.0),
      color: Colors.black12.withOpacity(0.05),
      child: GridView.count(
        crossAxisCount: smallScreenGrid ? 4 : 1,
        childAspectRatio: extraLargeScreenGrid
            ? 1.0
            : largeScreenGrid
                ? 1.0
                : smallScreenGrid
                    ? 1.0
                    : tabScreenGrid
                        ? 2.6
                        : 1.6,
        mainAxisSpacing: smallScreenGrid ? 15.0 : 10.0,
        crossAxisSpacing: smallScreenGrid ? 15.0 : 10.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.radar_sharp,
                    size: 45.0,
                    color: Colors.indigo[600],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 05.0, top: 08.0),
                    child: Text(
                      'Shopfood',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.indigo[600],
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 30.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.mail_outline, color: Colors.grey, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'support@shopsnine.com',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.grey, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        '+032 309 830987',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline, color: Colors.grey, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        '032 309 830987',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.rotate_left_outlined,
                        color: Colors.grey, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        '30 Days return',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.tab, color: Colors.grey, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Free Shipping',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 15.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 21.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Men's Fashion",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Shoes',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Watches',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Women's Fashion",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Sandals',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 15.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 21.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 22.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Return & Exchanges',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Support',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Privacy & Policy',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 15.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Join us',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 21.0),
                child: Row(
                  children: [
                    Icon(Icons.facebook, color: Colors.indigo, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Facebook',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.twitter,
                        color: Colors.blue, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Twitter',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.linked_camera, color: Colors.indigo, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Linkedin',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.youtube_searched_for,
                        color: Colors.red, size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Youtube',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 08.0, top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.insert_chart,
                        color: Colors.purple[300], size: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: Text(
                        'Instagram',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
