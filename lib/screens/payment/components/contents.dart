// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:apporder/models/provinces.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/product/product_screend.dart';
import 'package:apporder/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

late ProductProvider productProvider;

class _ContentsState extends State<Contents> {
  int _activeStepIndex = 0;
  List<int> check = [-1];
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();

  List<String> tinh = [];
  List<String> huyen = [];
  List<String> xa = [];
  List<Provinces> myList = [];
  final TextEditingController tinhT = TextEditingController();
  final TextEditingController huyenT = TextEditingController();
  final TextEditingController xaT = new TextEditingController();
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/country.json');
    setState(() {
      List<Provinces> myLists = [];
      if (response.isNotEmpty) {
        myLists = (json.decode(response) as List<dynamic>)
            .map<Provinces>((item) => Provinces.fromJson(item))
            .toList();
        this.myList = myLists;
      }
    });
  }

  Map<String, dynamic> formData = {};

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Account'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number Phone',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: code,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Postal Code',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Address'),
          content: StreamBuilder<List<Provinces>>(
              stream: categoryList().asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                tinh = [];
                if (snapshot.data!.isNotEmpty) {
                  snapshot.data!.asMap().forEach((index, element) {
                    tinh.add(element.name);
                  });
                }
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextField(
                                  controller: tinhT,
                                  decoration: InputDecoration(
                                    labelText: 'Tỉnh',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      huyen = [];
                                      if (snapshot.data!.isNotEmpty) {
                                        snapshot.data!
                                            .asMap()
                                            .forEach((index, element) {
                                          if (element.name == value) {
                                            element.districts
                                                .forEach((elements) {
                                              huyen.add(elements.name);
                                            });
                                          }
                                        });
                                      }
                                    });
                                  },
                                )),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    setState(() {
                                      huyenT.text = '';
                                      xaT.text = '';
                                      huyen = [];
                                      xa = [];
                                      if (snapshot.data!.isNotEmpty) {
                                        snapshot.data!
                                            .asMap()
                                            .forEach((index, element) {
                                          if (element.name == value) {
                                            element.districts
                                                .forEach((elements) {
                                              huyen.add(elements.name);
                                            });
                                          }
                                        });
                                      }
                                    });
                                    tinhT.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return tinh.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return PopupMenuItem(
                                          child: Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextField(
                                  controller: huyenT,
                                  decoration:
                                      InputDecoration(labelText: 'Huyện'),
                                  onChanged: (value) {
                                    setState(() {
                                      xa = [];
                                      if (snapshot.data!.isNotEmpty) {
                                        snapshot.data!
                                            .asMap()
                                            .forEach((index, element) {
                                          if (element.name == tinhT.text) {
                                            element.districts
                                                .forEach((elements) {
                                              if (elements.name == value) {
                                                elements.wards
                                                    .forEach((elementss) {
                                                  xa.add(elementss.name);
                                                });
                                              }
                                            });
                                          }
                                        });
                                      }
                                    });
                                  },
                                )),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    setState(() {
                                      xaT.text = '';
                                      xa = [];
                                      if (snapshot.data!.isNotEmpty) {
                                        snapshot.data!
                                            .asMap()
                                            .forEach((index, element) {
                                          if (element.name == tinhT.text) {
                                            element.districts
                                                .forEach((elements) {
                                              if (elements.name == value) {
                                                elements.wards
                                                    .forEach((elementss) {
                                                  xa.add(elementss.name);
                                                });
                                              }
                                            });
                                          }
                                        });
                                      }
                                    });
                                    huyenT.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return huyen.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return PopupMenuItem(
                                          child: Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextField(
                                  controller: xaT,
                                  decoration: InputDecoration(labelText: 'Xã'),
                                  onChanged: (value) {},
                                )),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    xaT.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return xa.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return PopupMenuItem(
                                          child: Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Confirm'),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Phone: ${phone.text}'),
                Text('Code Bill: kl23'),
                Text(
                    'Address : ${xaT.text + ', ' + huyenT.text + ', ' + tinhT.text}'),
                Text('PinCode : ${code.text}'),
              ],
            ),
          ),
        )
      ];
  int seletedIndex = 0;
  bool isLogin = false;
  List<Map<String, String>> menuData = [
    {"text": "Food", "icon": "assets/images/restaurant.png"},
    {"text": "Drink", "icon": "assets/images/cocktail.png"},
    {"text": "Veges", "icon": "assets/images/vegetable.png"},
    {"text": "Dessert", "icon": "assets/images/cupcake.png"},
    {"text": "Snack", "icon": "assets/images/snack.png"},
  ];
  @override
  void initState() {
    ProductProvider initproductProvider =
        Provider.of<ProductProvider>(context, listen: false);
    getCallAllFunction(initproductProvider);
    super.initState();
    readJson();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<Provinces>> categoryList() async {
    return await myList;
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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 140.0 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Responsive.isDesktop(context) ? 800 : 900,
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Responsive.isDesktop(context)
                    ? Expanded(
                        flex: 2,
                        child: Column(
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
                                          if (menuData[index]['text'] == "Food")
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
                                                  color: check.elementAt(0) ==
                                                          index
                                                      ? Colors.white
                                                      : Color(0xDAC2C2C2f),
                                                  offset: Offset(4.0, 4.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0),
                                              BoxShadow(
                                                  color: Colors.white,
                                                  offset: Offset(-4.0, -4.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                        Stepper(
                          type: StepperType.vertical,
                          currentStep: _activeStepIndex,
                          steps: stepList(),
                          onStepContinue: () {
                            if (_activeStepIndex < (stepList().length - 1)) {
                              setState(() {
                                _activeStepIndex += 1;
                              });
                            } else {
                              print('Submited');
                            }
                          },
                          onStepCancel: () {
                            if (_activeStepIndex == 0) {
                              return;
                            }

                            setState(() {
                              _activeStepIndex -= 1;
                            });
                          },
                          onStepTapped: (int index) {
                            setState(() {
                              _activeStepIndex = index;
                            });
                          },
                          controlsBuilder: (context,
                              {onStepContinue, onStepCancel}) {
                            final isLastStep =
                                _activeStepIndex == stepList().length - 1;
                            return Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: onStepContinue,
                                      child: (isLastStep)
                                          ? const Text('Submit')
                                          : const Text('Next'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (_activeStepIndex > 0)
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: onStepCancel,
                                        child: const Text('Back'),
                                      ),
                                    )
                                ],
                              ),
                            );
                          },
                        ),
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
}
