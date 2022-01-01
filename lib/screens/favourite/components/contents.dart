// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';
import 'dart:ui';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/login_signup/loginsignup_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/details/chitietscreen.dart';
import 'package:apporder/screens/homes/components/loca.dart';
import 'package:apporder/screens/product/product_screend.dart';
import 'package:apporder/screens/products/products_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

late ProductProvider productProvider;

class _ContentsState extends State<Contents> {
  List<int> check = [-1];
  int seletedIndex = 0;
  bool isLogin = false;
  List<Map<String, int>> isCheckItem = [];
  late DocumentReference<Map<String, dynamic>> likeRef;
  Map<String, dynamic> data = {};
  List<Map<String, String>> menuData = [
    {"text": "Food", "icon": "assets/images/restaurant.png"},
    {"text": "Drink", "icon": "assets/images/cocktail.png"},
    {"text": "Veges", "icon": "assets/images/vegetable.png"},
    {"text": "Dessert", "icon": "assets/images/cupcake.png"},
    {"text": "Snack", "icon": "assets/images/snack.png"},
  ];
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser == null) {
      Timer.run(() {
        Navigator.pushReplacementNamed(context, LoginSignupScreen.routeName);
      });
    } else {
      ProductProvider initproductProvider =
          Provider.of<ProductProvider>(context, listen: false);
      getCallAllFunction(initproductProvider);
      likeRef = FirebaseFirestore.instance
          .collection("User")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("like")
          .doc("listid");
    }
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      likeRef.get().then((value) => {
            if (value.data()!.isNotEmpty)
              data = value.data() as Map<String, dynamic>
          });
    }
  }

  void getCallAllFunction(ProductProvider initproductProvider) async {
    initproductProvider.getFoodData();
    initproductProvider.getDessertData();
    initproductProvider.getDrinktData();
    initproductProvider.getSnackData();
    initproductProvider.getVegesData();
    initproductProvider.getLikeData();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    if (FirebaseAuth.instance.currentUser != null) {
      if (productProvider.getidloveList.isNotEmpty) {
        productProvider.getListLove(listId: productProvider.getidloveList);
      }
    }
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 140.0 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Responsive.isDesktop(context) ? 500 : 700,
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Responsive.isDesktop(context)
                    ? Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: Responsive.getSize(context).width,
                                  height: 50,
                                  color: Colors.black38,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Menu"),
                                      InkWell(
                                          onTap: () {
                                            FluroRouters.router.navigateTo(
                                              context,
                                              ProductsScreen.routeName,
                                              replace: true,
                                            );
                                          },
                                          child: Icon(MdiIcons.menu))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 406,
                                  child: ListView.builder(
                                    itemCount: menuData.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () => {
                                          setState(
                                            () => {
                                              seletedIndex = index,
                                              if (menuData[index]['text'] ==
                                                  "Food")
                                                Navigator.pushNamed(
                                                  context,
                                                  ProductScreen.routeName,
                                                  arguments: ScreenArguments(
                                                      name: "Food",
                                                      snapshot: productProvider
                                                          .getfoodList),
                                                ),
                                              if (menuData[index]['text'] ==
                                                  "Drink")
                                                Navigator.pushNamed(
                                                  context,
                                                  ProductScreen.routeName,
                                                  arguments: ScreenArguments(
                                                      name: "Drink",
                                                      snapshot: productProvider
                                                          .getdrinkList),
                                                ),
                                              if (menuData[index]['text'] ==
                                                  "Veges")
                                                Navigator.pushNamed(
                                                  context,
                                                  ProductScreen.routeName,
                                                  arguments: ScreenArguments(
                                                      name: "Veges",
                                                      snapshot: productProvider
                                                          .getvegesList),
                                                ),
                                              if (menuData[index]['text'] ==
                                                  "Snack")
                                                Navigator.pushNamed(
                                                  context,
                                                  ProductScreen.routeName,
                                                  arguments: ScreenArguments(
                                                      name: "Snack",
                                                      snapshot: productProvider
                                                          .getsnackList),
                                                ),
                                              if (menuData[index]['text'] ==
                                                  "Dessert")
                                                Navigator.pushNamed(
                                                  context,
                                                  ProductScreen.routeName,
                                                  arguments: ScreenArguments(
                                                      name: "Dessert",
                                                      snapshot: productProvider
                                                          .getdessertList),
                                                ),
                                            },
                                          ),
                                        },
                                        onHover: (ischeck) {
                                          setState(() {
                                            if (ischeck) {
                                              check.clear();
                                              check.add(index);
                                            } else {
                                              check.remove(index);
                                              check.add(-1);
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: check.elementAt(
                                                                  0) ==
                                                              index
                                                          ? Colors.white
                                                          : Color(0xDAC2C2C2f),
                                                      offset: Offset(4.0, 4.0),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 1.0),
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      offset:
                                                          Offset(-4.0, -4.0),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 1.0),
                                                ]),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.asset(
                                                      menuData[index]['icon']
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(menuData[index]['text']
                                                      .toString()),
                                                  Spacer(
                                                    flex: 8,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: Responsive.isDesktop(context)
                        ? EdgeInsets.only(left: 5.0)
                        : EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Responsive.isDesktop(context)
                            ? Container()
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Explore Catagories",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                ProductsScreen.routeName);
                                          },
                                          child: Text(
                                            "See All",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: menuData.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => {
                                            setState(
                                              () => {
                                                seletedIndex = index,
                                                if (menuData[index]['text'] ==
                                                    "Food")
                                                  Navigator.pushNamed(
                                                    context,
                                                    ProductScreen.routeName,
                                                    arguments: ScreenArguments(
                                                        name: "Food",
                                                        snapshot:
                                                            productProvider
                                                                .getfoodList),
                                                  ),
                                                if (menuData[index]['text'] ==
                                                    "Drink")
                                                  Navigator.pushNamed(
                                                    context,
                                                    ProductScreen.routeName,
                                                    arguments: ScreenArguments(
                                                        name: "Drink",
                                                        snapshot:
                                                            productProvider
                                                                .getdrinkList),
                                                  ),
                                                if (menuData[index]['text'] ==
                                                    "Veges")
                                                  Navigator.pushNamed(
                                                    context,
                                                    ProductScreen.routeName,
                                                    arguments: ScreenArguments(
                                                        name: "Veges",
                                                        snapshot:
                                                            productProvider
                                                                .getvegesList),
                                                  ),
                                                if (menuData[index]['text'] ==
                                                    "Snack")
                                                  Navigator.pushNamed(
                                                    context,
                                                    ProductScreen.routeName,
                                                    arguments: ScreenArguments(
                                                        name: "Snack",
                                                        snapshot:
                                                            productProvider
                                                                .getsnackList),
                                                  ),
                                                if (menuData[index]['text'] ==
                                                    "Dessert")
                                                  Navigator.pushNamed(
                                                    context,
                                                    ProductScreen.routeName,
                                                    arguments: ScreenArguments(
                                                        name: "Dessert",
                                                        snapshot: productProvider
                                                            .getdessertList),
                                                  ),
                                              },
                                            ),
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 15.0),
                                            child: SizedBox(
                                              width: 80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: listMenu(
                                                    Responsive.getSize(context),
                                                    menuData[index]['icon'],
                                                    seletedIndex == index,
                                                    menuData[index]['text']),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tất Cả Sản Phẩm"),
                              Divider(
                                thickness: 2,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        _buildProduct(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> listMenu(Size _size, String? icon, bool ischeck, String? label) {
    return <Widget>[
      Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ischeck ? Color(0xFFfc6a57) : Color(0xFFffe8e5),
        ),
        child: Center(
          child: Image.asset(
            "./${icon!}",
            // icon!,
            height: 50,
            width: 50,
            color: ischeck ? Colors.white : Colors.black87,
          ),
        ),
      ),
      Text(
        label!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: ischeck ? Color(0xFFfc6a57) : Colors.black87,
        ),
      ),
    ];
  }

  Widget _buildProduct(BuildContext context) {
    return SizedBox(
      width: Responsive.getSize(context).width,
      height: 430,
      child: SingleChildScrollView(
        child: Center(
          child: StreamBuilder(
            stream: productProvider.getLikeData().asStream(),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.isEmpty) {
                return Text("Chưa có sản phẩm nào được thích");
              }
              return Wrap(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    if (data.containsKey(snapshot.data!.elementAt(i).id))
                      SizedBox(
                          width: 270,
                          height: 300,
                          child: LocationWidget(
                              product: snapshot.data!.elementAt(i))),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget productsLike(BuildContext context, Product product, int id) {
    return Stack(
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: product.image.elementAt(0),
            imageBuilder: (context, imageProvider) => Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
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
                      Text(product.name),
                      Spacer(),
                      Text(product.price.toString()),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(
                              context,
                              ChitietScreen.routeName,
                              arguments: DetailArguments(snapshot: product),
                            );
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.red, Colors.redAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Đặt Mua',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
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
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if (isLogin) {
                        if (isCheckItem.elementAt(id)['heart'] == 1) {
                          isCheckItem.elementAt(id)['heart'] = 0;
                        } else {
                          isCheckItem.elementAt(id)['heart'] = 1;
                        }
                      } else {
                        Navigator.pushNamed(
                            context, LoginSignupScreen.routeName);
                      }
                    });
                  },
                  child: isCheckItem.elementAt(id)['heart'] == 1
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
