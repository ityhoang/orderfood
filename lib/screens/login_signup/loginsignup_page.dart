// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/login_signup/components/body.dart';
import 'package:apporder/screens/login_signup/components/bodys.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);
  static String routeName = "/login_signup";
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Bodys(),
      tablet: Bodys(),
      mobile: Body(),
      keys: keys,
    );
  }
}
