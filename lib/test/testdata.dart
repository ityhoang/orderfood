import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

class TestData extends StatefulWidget {
  const TestData({Key? key}) : super(key: key);

  @override
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  String msg = 'Flutter RaisedButton Example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: _changeText,
          // ignore: prefer_const_constructors
          child: Text(
            msg,
            style: const TextStyle(fontSize: 20.0),
          ),
          color: Colors.blueAccent,
          textColor: Colors.white,
        ),
      ),
    );
  }

  _changeText() {
    setState(() {
      // final dbRef = FirebaseDatabase.instance.reference().child("login");
      // dbRef.reference().once().then((result) {
      //   final LinkedHashMap value = result.value;
      //   value.forEach((key, value) {
      //     // print(value['name']);
      //   });
      // });
      // if (msg.startsWith('F')) {
      //   msg = dbRef.child(path);
      // } else {
      //   msg = 'Flutter RaisedButton Example';
      // }
    });
  }
}
