// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/details/chitietscreen.dart';
import 'package:apporder/screens/homes/components/loca.dart';
import 'package:apporder/screens/login_signup/loginsignup_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

late ProductProvider productProvider;

class _ContentsState extends State<Contents> {
  late DocumentReference<Map<String, dynamic>> likeRef;
  Map<String, dynamic> data = {};
  @override
  void initState() {
    ProductProvider initproductProvider =
        Provider.of<ProductProvider>(context, listen: false);
    getCallAllFunction(initproductProvider);
    super.initState();
    getCurrentUserUid().then((value) => {
          if (value.isNotEmpty || FirebaseAuth.instance.currentUser != null)
            {
              likeRef = FirebaseFirestore.instance
                  .collection("User")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("like")
                  .doc("listid"),
              likeRef.get().then((value) => {
                    if (value.data()!.isNotEmpty)
                      data = value.data() as Map<String, dynamic>
                  })
            }
        });
  }

  void getCallAllFunction(ProductProvider initproductProvider) {
    initproductProvider.getFoodData();
    initproductProvider.getDessertData();
    initproductProvider.getDrinktData();
    initproductProvider.getSnackData();
    initproductProvider.getVegesData();
    initproductProvider.getLikeData();
  }

  Future<String> getCurrentUserUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 140.0 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 250,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              child: StreamBuilder(
                stream: productProvider.getLikeData().asStream(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 10, bottom: 10, right: 10),
                        child: Container(
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0x3D7A7A7A), width: 2)),
                          child: productsLike(
                              context, snapshot.data![index], index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: ScrollableListTabView(
              tabHeight: 48,
              bodyAnimationDuration: const Duration(milliseconds: 150),
              tabAnimationCurve: Curves.easeOut,
              tabAnimationDuration: const Duration(milliseconds: 200),
              style: GoogleFonts.abhayaLibre(),
              tabs: [
                ScrollableListTab(
                  tab: ListTab(
                      label: Text('Dessert'),
                      icon: Icon(FontAwesomeIcons.iceCream),
                      showIconOnList: true),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: productProvider.getdessertList
                              .map((e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e)))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                ScrollableListTab(
                  tab: ListTab(
                    label: Text('Snack'),
                    icon: Icon(FontAwesomeIcons.cookie),
                    showIconOnList: true,
                  ),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: productProvider.getsnackList
                              .map((e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e)))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                ScrollableListTab(
                  tab: ListTab(
                    label: Text('Food'),
                    icon: Icon(FontAwesomeIcons.utensils),
                    showIconOnList: true,
                  ),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: productProvider.getfoodList
                              .map((e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e)))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                ScrollableListTab(
                  tab: ListTab(
                    label: Text('Veges'),
                    icon: Icon(FontAwesomeIcons.carrot),
                    showIconOnList: true,
                  ),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: productProvider.getvegesList
                              .map((e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e)))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                ScrollableListTab(
                  tab: ListTab(
                      label: Text('Drink'),
                      icon: Icon(FontAwesomeIcons.wineGlass),
                      showIconOnList: true),
                  body: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Wrap(
                          children: productProvider.getdrinkList
                              .map((e) => SizedBox(
                                  width: 270,
                                  height: 300,
                                  child: LocationWidget(product: e)))
                              .toList(),
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

  Widget productsLike(BuildContext context, Product product, int id) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: product.image.elementAt(0),
              imageBuilder: (context, imageProvider) => Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 140,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 80,
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                shadows: [
                                  Shadow(
                                      color: Colors.grey.shade300,
                                      offset: Offset(3.0, 3.0),
                                      blurRadius: 3.0),
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 3.0),
                                ]),
                          ),
                          Spacer(),
                          Text(NumberFormat.currency(locale: 'vi')
                              .format(product.price)
                              .toString()),
                        ]),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              FluroRouters.router
                                  .navigateTo(context, ChitietScreen.routeName,
                                      routeSettings: RouteSettings(
                                        arguments:
                                            DetailArguments(snapshot: product),
                                      ),
                                      replace: true);
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xffe7e7e7),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0xffa6a6a6),
                                    offset: Offset(2, 2),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0xffffffff),
                                    offset: Offset(-2, -2),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  stops: [0, 1],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xffd0d0d0),
                                    Color(0xfff7f7f7)
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                  15,
                                ))),
                            child: Center(
                              child: Text(
                                'Đặt Mua',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 12,
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
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xDAC2C2C2f),
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.5),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.5),
                  ]),
              child: InkWell(
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser != null) {
                      String uid = product.id;
                      likeRef.get().then((value) {
                        var myMap = value.data() as Map<String, dynamic>;
                        if (value.data() != null) {
                          if (myMap.containsKey(uid)) {
                            likeRef.update({uid: FieldValue.delete()});

                            setState(() {
                              data.remove(uid);
                            });
                          } else {
                            likeRef.update({uid: true});
                            setState(() {
                              data[uid] = true;
                            });
                          }
                        } else {
                          likeRef.update({uid: true});
                          setState(() {
                            data[uid] = true;
                          });
                        }
                      });
                    } else {
                      Navigator.pushNamed(context, LoginSignupScreen.routeName);
                    }
                  },
                  child: data.isNotEmpty && data.containsKey(product.id)
                      ? Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                        )
                      : Icon(FontAwesomeIcons.heart)),
            ),
          ),
        ),
      ],
    );
  }
}

// https://tamnguyen.com.vn/thiet-ke-website-do-an-vie-food.html
