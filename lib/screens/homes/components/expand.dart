// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, iterable_contains_unrelated_type, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';

import 'package:apporder/models/cart.dart';
import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/provider/test.dart';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/details/chitietscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpandedContentWidget extends StatefulWidget {
  final Product product;
  const ExpandedContentWidget({Key? key, required this.product})
      : super(key: key);

  @override
  _ExpandedContentWidgetState createState() => _ExpandedContentWidgetState();
}

late ProductProvider productProvider;
late Test testdata;

class _ExpandedContentWidgetState extends State<ExpandedContentWidget> {
  late SharedPreferences prefs;
  Future settingSharepre() async {
    return await SharedPreferences.getInstance();
  }

  bool check = false;
  Future<String> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cart') ?? '';
  }

  List<CartModel> ty = [];
  bool checkcart = true, icon = true;
  Future<void> setcardShare(Product product) async {
    getList().then((value) => {
          if (value.isNotEmpty)
            {
              ty = (json.decode(value) as List<dynamic>)
                  .map<CartModel>((item) => CartModel.fromJson(item))
                  .toList(),
              if (ty.isNotEmpty)
                {
                  ty.forEach((element) {
                    if (element.id == product.id) {
                      element.quantity += 1;
                      checkcart = false;
                    }
                  }),
                  if (checkcart)
                    {
                      ty.add(CartModel(
                        image: product.image.elementAt(0),
                        id: product.id,
                        size: "S",
                        name: product.name,
                        price: product.price,
                        quantity: 1,
                      ))
                    }
                }
              else
                {
                  ty.add(CartModel(
                    image: product.image.elementAt(0),
                    id: product.id,
                    size: "S",
                    name: product.name,
                    price: product.price,
                    quantity: 1,
                  ))
                },
              if (ty.isNotEmpty)
                {
                  settingSharepre().then(
                    (value) => {
                      prefs = value,
                      prefs.setString('cart', CartModel.encode(ty)),
                    },
                  )
                }
            }
          else
            {
              ty.add(CartModel(
                image: product.image.elementAt(0),
                id: product.id,
                size: "1",
                name: product.name,
                price: product.price,
                quantity: 1,
              )),
              if (ty.isNotEmpty)
                {
                  settingSharepre().then(
                    (value) => {
                      prefs = value,
                      prefs.setString('cart', CartModel.encode(ty)),
                    },
                  )
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    testdata = Provider.of<Test>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xDAC2C2C2f),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0),
              ]),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.product.price.toString()),
              SizedBox(height: 8),
              buildIconView(context, widget.product),
              // SizedBox(height: 12),
              // buildReview(location: location)
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              gradient: LinearGradient(
                stops: [0, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffe6e6e6), Color(0xffffffff)],
              ),
            ),
            child: InkWell(
              onTap: () {
                productProvider.getCheckOutData(
                  image: widget.product.image.elementAt(0),
                  id: widget.product.id,
                  size: "S",
                  name: widget.product.name,
                  price: widget.product.price,
                  quantity: 1,
                );
                setState(() {
                  testdata.addCount();
                  setcardShare(widget.product);
                });
              },
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Color(0xFF8B8B8B),
                  size: 24.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIconView(BuildContext context, Product product) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              FluroRouters.router.navigateTo(context, ChitietScreen.routeName,
                  routeSettings: RouteSettings(
                    arguments: DetailArguments(snapshot: product),
                  ),
                  replace: true);
            },
            child: Center(
              child: Icon(
                MdiIcons.eye,
                color: Colors.blueGrey[100],
                size: 24.0,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: InkWell(
              onTap: () {
                setState(() {
                  print("tyhoang");
                });
              },
              onHover: (isHover) {
                setState(() {
                  if (isHover) {
                    check = true;
                  } else {
                    check = false;
                  }
                });
              },
              child: check
                  ? Icon(FontAwesomeIcons.solidHeart)
                  : Icon(FontAwesomeIcons.heartBroken),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      );

//   Widget buildReview({
//     required Location location,
//   }) =>
//       Row(
//         children: location
//             .map((review) => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: CircleAvatar(
//                     radius: 16,
//                     backgroundColor: Colors.black12,
//                     backgroundImage: AssetImage(review.urlImage),
//                   ),
//                 ))
//             .toList(),
//       );
}
