// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'dart:ui';

import 'package:apporder/models/sliders.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

late ProductProvider productProvider;

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  List isSelected = [true, false, false, false, false, false];
  int _current = 0;
  List<Widget> generateImageTiles(screenSize, List<Sliders> sliders) {
    return sliders
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              element.image,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    var screenSize = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 50),
        color: Colors.white,
        child: StreamBuilder(
            stream: productProvider.getSliderData().asStream(),
            builder: (context, AsyncSnapshot<List<Sliders>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var imageSliders = generateImageTiles(screenSize, snapshot.data!);
              return Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index, realIndex) {
                      return imageSliders[index];
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 18 / 8,
                      autoPlayAnimationDuration: Duration(
                        seconds: 2,
                      ),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            if (i == index) {
                              isSelected[i] = true;
                            } else {
                              isSelected[i] = false;
                            }
                          }
                        });
                      },
                    ),
                    carouselController: _controller,
                  ),
                  AspectRatio(
                    aspectRatio: 18 / 8,
                    child: Center(
                      child: Text(
                        snapshot.data!.elementAt(_current).name.toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 8,
                          decoration: TextDecoration.none,
                          fontFamily: 'Electrolize',
                          fontSize: screenSize.width / 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Responsive.isDesktop(context)
                      ? AspectRatio(
                          aspectRatio: 17 / 8,
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Responsive.getSize(context).width / 8,
                                  right: Responsive.getSize(context).width / 8,
                                ),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: Responsive.getSize(context).height /
                                          50,
                                      bottom:
                                          Responsive.getSize(context).height /
                                              50,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++)
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _controller.animateToPage(i,
                                                    duration:
                                                        Duration(seconds: 2));
                                              });
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: Responsive.getSize(
                                                                context)
                                                            .height /
                                                        80,
                                                    bottom: Responsive.getSize(
                                                                context)
                                                            .height /
                                                        90,
                                                  ),
                                                  child: Text(snapshot.data!
                                                      .elementAt(i)
                                                      .name
                                                      .toUpperCase()),
                                                ),
                                                Visibility(
                                                  visible: isSelected[i],
                                                  child: Container(
                                                    height: 5,
                                                    width: Responsive.getSize(
                                                                context)
                                                            .width /
                                                        40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            }));
  }
}
