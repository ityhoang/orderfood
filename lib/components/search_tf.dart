// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:apporder/models/product.dart';
import 'package:apporder/models/screenarguments.dart';
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/details/chitietscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDelegate extends SearchDelegate<String> {
  late ProductProvider productProvider;
  List<Product> data = [];

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);

    return StreamBuilder<List<Product>>(
      stream: productProvider.getAllData().asStream(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Product> listToShow;
        if (query.isNotEmpty)
          listToShow = snapshot.data!
              .where((e) => e.name.contains(query) && e.name.startsWith(query))
              .toList();
        else
          listToShow = snapshot.data!;
        return ListView.builder(
          itemCount: listToShow.length,
          itemBuilder: (_, i) {
            Product noun = listToShow[i];
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CachedNetworkImage(
                    imageUrl: noun.image.elementAt(0),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 30,
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                title: Text(noun.name),
                onTap: () {
                  FluroRouters.router.navigateTo(
                      context, ChitietScreen.routeName,
                      routeSettings: RouteSettings(
                          arguments: DetailArguments(snapshot: noun)),
                      replace: true);
                },
              ),
            );
          },
        );
      },
    );
  }
}
