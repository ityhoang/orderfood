// ignore_for_file: avoid_function_literals_in_foreach_calls, curly_braces_in_flow_control_structures, unnecessary_string_interpolations, empty_catches, avoid_print

import 'dart:async';

import 'package:apporder/models/cart.dart';
import 'package:apporder/models/news.dart';
import 'package:apporder/models/product.dart';
import 'package:apporder/models/sliders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  late Product foodData;

  List<Product> food = [];

  late Product dessertData;
  List<Product> dessert = [];

  late Product drinkData;
  List<Product> drink = [];

  late Product snackData;
  List<Product> snack = [];

  late Product vegesData;
  List<Product> veges = [];

  late Product allData;
  List<Product> alldata = [];

  late News allnewsData;
  List<News> allnewsdata = [];

  late Product likeData;
  List<Product> like = [];

  late Product loveData;
  List<Product> love = [];

  late String idloveData;
  List<String> idlove = [];

  late Sliders slidersData;
  List<Sliders> sliders = [];

  late CartModel checkOutModel;
  List<CartModel> checkOutModelList = [];

  Future<void> getFoodData() async {
    List<Product> newList = [];

    CollectionReference data = FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("A8JoMU51G5b0O2bdLqTf")
        .collection("food");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        List<String> img = [];
        img.add(element.get("image"));
        Future<QuerySnapshot> images = getListImage(data: data, id: element.id);

        images.then((value) => value.docs.forEach((element) {
              if (element.get("image").toString().isNotEmpty)
                img.add(element.get("image"));
            }));
        foodData = Product(
          image: img,
          name: element.get("name"),
          price: element.get("price"),
          numlike: element.get("number_like"),
          like: element.get("like"),
          content: element.get("content"),
          id: element.id,
          catoname: "food",
        );
        newList.add(foodData);
      },
    );
    food = newList;
    notifyListeners();
  }

  List<Product> get getfoodList {
    return food;
  }

  Future<void> getDessertData() async {
    List<Product> newList = [];

    CollectionReference data = FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("A8JoMU51G5b0O2bdLqTf")
        .collection("dessert");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        List<String> img = [];
        img.add(element.get("image"));
        Future<QuerySnapshot> images = getListImage(data: data, id: element.id);

        images.then((value) => value.docs.forEach((element) {
              if (element.get("image").toString().isNotEmpty)
                img.add(element.get("image"));
            }));
        dessertData = Product(
          image: img,
          name: element.get("name"),
          price: element.get("price"),
          numlike: element.get("number_like"),
          like: element.get("like"),
          content: element.get("content"),
          id: element.id,
          catoname: "dessert",
        );
        newList.add(dessertData);
      },
    );
    dessert = newList;
    notifyListeners();
  }

  List<Product> get getdessertList {
    return dessert;
  }

  Future<void> getDrinktData() async {
    List<Product> newList = [];

    CollectionReference data = FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("A8JoMU51G5b0O2bdLqTf")
        .collection("drink");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        List<String> img = [];
        img.add(element.get("image"));
        Future<QuerySnapshot> images = getListImage(data: data, id: element.id);

        images.then((value) => value.docs.forEach((element) {
              if (element.get("image").toString().isNotEmpty)
                img.add(element.get("image"));
            }));
        drinkData = Product(
          image: img,
          name: element.get("name"),
          price: element.get("price"),
          numlike: element.get("number_like"),
          like: element.get("like"),
          content: element.get("content"),
          id: element.id,
          catoname: "drink",
        );
        newList.add(drinkData);
      },
    );
    drink = newList;
    notifyListeners();
  }

  List<Product> get getdrinkList {
    return drink;
  }

  Future<void> getSnackData() async {
    List<Product> newList = [];
    CollectionReference data = FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("A8JoMU51G5b0O2bdLqTf")
        .collection("snack");
    QuerySnapshot shirtSnapShot = await data.get();

    shirtSnapShot.docs.forEach(
      (element) {
        List<String> img = [];
        img.add(element.get("image"));

        Future<QuerySnapshot> images = getListImage(data: data, id: element.id);

        images.then((value) => value.docs.forEach((element) {
              if (element.get("image").toString().isNotEmpty)
                img.add(element.get("image"));
            }));
        snackData = Product(
          image: img,
          name: element.get("name"),
          price: element.get("price"),
          numlike: element.get("number_like"),
          like: element.get("like"),
          content: element.get("content"),
          id: element.id,
          catoname: "snack",
        );
        newList.add(snackData);
      },
    );
    snack = newList;
    notifyListeners();
  }

  List<Product> get getsnackList {
    return snack;
  }

  Future<void> getVegesData() async {
    List<Product> newList = [];
    CollectionReference data = FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("A8JoMU51G5b0O2bdLqTf")
        .collection("veges");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        List<String> img = [];
        img.add(element.get("image"));

        Future<QuerySnapshot> images = getListImage(data: data, id: element.id);

        images.then((value) => value.docs.forEach((element) {
              if (element.get("image").toString().isNotEmpty)
                img.add(element.get("image"));
            }));
        vegesData = Product(
          image: img,
          name: element.get("name"),
          price: element.get("price"),
          numlike: element.get("number_like"),
          like: element.get("like"),
          content: element.get("content"),
          id: element.id,
          catoname: "veges",
        );
        newList.add(vegesData);
      },
    );
    veges = newList;
    notifyListeners();
  }

  List<Product> get getvegesList {
    return veges;
  }

  Future<List<Product>> getAllData() async {
    List<Product> newList = [];
    List<String> nameList = ["veges", "snack", "food", "drink", "dessert"];
    for (var name in nameList) {
      CollectionReference data = FirebaseFirestore.instance
          .collection("categoryicon")
          .doc("A8JoMU51G5b0O2bdLqTf")
          .collection("$name");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach(
        (element) {
          if (element.get('like').toString() == "1") {
            List<String> img = [];
            img.add(element.get("image"));

            Future<QuerySnapshot> images =
                getListImage(data: data, id: element.id);

            images.then((value) => value.docs.forEach((element) {
                  if (element.get("image").toString().isNotEmpty)
                    img.add(element.get("image"));
                }));
            allData = Product(
              image: img,
              name: element.get("name"),
              price: element.get("price"),
              numlike: element.get("number_like"),
              like: element.get("like"),
              content: element.get("content"),
              id: element.id,
              catoname: name,
            );
            newList.add(allData);
          }
        },
      );
    }
    alldata = newList;
    return newList;
  }

  Future<List<Product>> getLikeData() async {
    List<Product> newList = [];
    List<String> nameList = ["veges", "snack", "food", "drink", "dessert"];
    for (var name in nameList) {
      CollectionReference data = FirebaseFirestore.instance
          .collection("categoryicon")
          .doc("A8JoMU51G5b0O2bdLqTf")
          .collection("$name");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach(
        (element) {
          if (element.get('like').toString() == "1") {
            List<String> img = [];
            img.add(element.get("image"));

            Future<QuerySnapshot> images =
                getListImage(data: data, id: element.id);

            images.then((value) => value.docs.forEach((element) {
                  if (element.get("image").toString().isNotEmpty)
                    img.add(element.get("image"));
                }));
            likeData = Product(
              image: img,
              name: element.get("name"),
              price: element.get("price"),
              numlike: element.get("number_like"),
              like: element.get("like"),
              content: element.get("content"),
              id: element.id,
              catoname: name,
            );
            newList.add(likeData);
          }
        },
      );
    }
    like = newList;
    return newList;
  }

  List<Product> get getlikeList {
    return like;
  }

  Future<QuerySnapshot> getListImage(
      {required CollectionReference data, required String id}) {
    return data.doc(id).collection("listImage").get();
  }

  void getCheckOutData({
    required int quantity,
    required num price,
    required String name,
    required String size,
    required String image,
    required String id,
  }) {
    bool check = true;
    if (checkOutModelList.isNotEmpty) {
      checkOutModelList.forEach((element) {
        if (element.id == id) {
          element.quantity += quantity;
          check = false;
        }
      });
      if (check) {
        checkOutModel = CartModel(
          size: size,
          price: price,
          name: name,
          image: image,
          quantity: quantity,
          id: id,
        );
        checkOutModelList.add(checkOutModel);
      }
    } else {
      checkOutModel = CartModel(
        size: size,
        price: price,
        name: name,
        image: image,
        quantity: quantity,
        id: id,
      );
      checkOutModelList.add(checkOutModel);
    }
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  Future<void> getidloveData({required String id}) async {
    List<String> newList = [];
    try {
      CollectionReference data = FirebaseFirestore.instance
          .collection("User")
          .doc("$id")
          .collection("like");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach((element) {
        idloveData = element.get("idproduct");
        newList.add(idloveData);
      });
    } catch (e) {}
    idlove = newList;
    notifyListeners();
  }

  List<String> get getidloveList {
    return idlove;
  }

  Future<void> getListLove({required List<String> listId}) async {
    List<Product> newList = [];
    List<String> nameList = ["veges", "snack", "food", "drink", "dessert"];
    for (var name in nameList) {
      CollectionReference data = FirebaseFirestore.instance
          .collection("categoryicon")
          .doc("A8JoMU51G5b0O2bdLqTf")
          .collection("$name");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach(
        (element) {
          listId.forEach((elements) {
            if (element.id == elements) {
              List<String> img = [];
              img.add(element.get("image"));

              Future<QuerySnapshot> images =
                  getListImage(data: data, id: element.id);

              images.then((value) => value.docs.forEach((element) {
                    if (element.get("image").toString().isNotEmpty)
                      img.add(element.get("image"));
                  }));
              loveData = Product(
                image: img,
                name: element.get("name"),
                price: element.get("price"),
                numlike: element.get("number_like"),
                like: element.get("like"),
                content: element.get("content"),
                id: element.id,
                catoname: name,
              );
              newList.add(loveData);
            }
          });
        },
      );
    }

    love = newList;
    notifyListeners();
  }

  List<Product> get getloveList {
    return love;
  }

  Future<String> getName({required String id}) async {
    String addname = '';
    List<String> nameList = ["veges", "snack", "food", "drink", "dessert"];
    for (var name in nameList) {
      CollectionReference data = FirebaseFirestore.instance
          .collection("categoryicon")
          .doc("A8JoMU51G5b0O2bdLqTf")
          .collection("$name");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach((element) {
        if (element.id == id) {
          addname = name;
        }
      });
    }
    return addname;
  }

  Future<void> addLove({required String id, required String idproduct}) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc("$id")
        .collection("like")
        .doc("$idproduct")
        .set({
          'idproduct': idproduct,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteLove(
      {required String id, required String idproduct}) async {
    print(id);
    await FirebaseFirestore.instance
        .collection("User")
        .doc("$id")
        .collection("like")
        .doc("$idproduct")
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<List<Product>> getListLoves({required List<String> listId}) async {
    List<Product> newList = [];
    List<String> nameList = ["veges", "snack", "food", "drink", "dessert"];

    for (var name in nameList) {
      CollectionReference data = FirebaseFirestore.instance
          .collection("categoryicon")
          .doc("A8JoMU51G5b0O2bdLqTf")
          .collection("$name");
      QuerySnapshot shirtSnapShot = await data.get();
      shirtSnapShot.docs.forEach(
        (element) {
          listId.forEach((elements) {
            if (element.id == elements) {
              List<String> img = [];
              img.add(element.get("image"));

              Future<QuerySnapshot> images =
                  getListImage(data: data, id: element.id);

              images.then((value) => value.docs.forEach((element) {
                    if (element.get("image").toString().isNotEmpty)
                      img.add(element.get("image"));
                  }));
              loveData = Product(
                image: img,
                name: element.get("name"),
                price: element.get("price"),
                numlike: element.get("number_like"),
                like: element.get("like"),
                content: element.get("content"),
                id: element.id,
                catoname: name,
              );
              newList.add(loveData);
            }
          });
        },
      );
    }

    return newList;
  }

  Future<List<News>> getAllNewsData() async {
    List<News> newList = [];
    CollectionReference data = FirebaseFirestore.instance.collection("news");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        allnewsData = News(
          contents: element.get("content"),
          image: element.get("image"),
          star: element.get("star"),
          hlihgts: element.get("highlights"),
          hot: element.get("hot"),
          id: element.id,
        );
        newList.add(allnewsData);
      },
    );
    allnewsdata = newList;
    return newList;
  }

  Future<List<Sliders>> getSliderData() async {
    List<Sliders> newList = [];
    CollectionReference data =
        FirebaseFirestore.instance.collection("imageslider");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        slidersData = Sliders(
          image: element.get("image"),
          name: element.get("name"),
          id: element.id,
        );
        newList.add(slidersData);
      },
    );
    sliders = newList;
    return newList;
  }

  Future<void> getSlidersData() async {
    List<Sliders> newList = [];
    CollectionReference data =
        FirebaseFirestore.instance.collection("imageslider");
    QuerySnapshot shirtSnapShot = await data.get();
    shirtSnapShot.docs.forEach(
      (element) {
        slidersData = Sliders(
          image: element.get("image"),
          name: element.get("name"),
          id: element.id,
        );
        newList.add(slidersData);
      },
    );
    sliders = newList;
  }

  List<Sliders> get getslidersList {
    return sliders;
  }
  // getAvatarUrlForProfile() async {
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("images")
  //       .child('/listmenu')
  //       .child("snack1.jpg");

  //   //get image url from firebase storage
  //   var url = await ref.getDownloadURL();

  //   // put the URL in the state, so that the UI gets rerendered
  //   print(url);
  // }
}
