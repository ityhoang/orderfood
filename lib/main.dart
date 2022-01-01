// ignore: unused_import
// ignore_for_file: prefer_const_constructors, deprecated_member_use

// ignore: unused_import
import 'package:apporder/provider/product_provider.dart';
import 'package:apporder/provider/test.dart';
import 'package:apporder/routes.dart';
import 'package:apporder/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  FluroRouters.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final bool ischeckauth = true;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<Test>(
          create: (context) => Test(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Order Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Color(0xFFFEF9EB),
        ),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: FluroRouters.router.generator,
      ),
    );
  }
}
