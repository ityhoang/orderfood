// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:apporder/models/product.dart';
import 'package:apporder/screens/homes/components/expand.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  final Product product;

  static var child;

  const LocationWidget({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: CachedNetworkImage(
        imageUrl: widget.product.image.elementAt(0),
        imageBuilder: (context, imageProvider) => Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: isExpanded ? 5 : 60,
              width: isExpanded ? 250 : 200,
              height: isExpanded ? 200 : 180,
              child: ExpandedContentWidget(product: widget.product),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: isExpanded ? 80 : 40,
              child: Container(
                /// space from white container
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                width: 250,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Stack(
                    children: [
                      buildImage(imageProvider),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTopText(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: onPanUpdate,
                                    child: Icon(Icons.location_on,
                                        color: Colors.white70)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        placeholder: (context, url) => Center(
            child: Container(
          child: CircularProgressIndicator(),
          width: 30,
          height: 30,
        )),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget buildImage(ImageProvider imageProvider) => SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      )));

  Widget buildTopText() => Text(
        widget.product.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
  void onPanUpdate() {
    setState(() {
      if (isExpanded) {
        isExpanded = false;
      } else {
        isExpanded = true;
      }
    });
  }
}
