import 'package:apporder/routes.dart';
import 'package:apporder/screens/favourite/favourite.dart';
import 'package:apporder/screens/homes/homes_screen.dart';
import 'package:apporder/screens/login_signup/loginsignup_page.dart';
import 'package:apporder/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  Future deleteShareprefence() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("uid");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: true,
            onTap: () {
              //   setState(() {
              //     homeColor = true;
              //     contactUsColor = false;
              //     checkoutColor = false;
              //     aboutColor = false;
              //     profileColor = false;
              //   });
              FluroRouters.router.navigateTo(
                context,
                HomesScreen.routeName,
                replace: true,
              );
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: true,
            onTap: () {
              // setState(() {
              //   checkoutColor = true;
              //   contactUsColor = false;
              //   homeColor = false;
              //   profileColor = false;
              //   aboutColor = false;
              // });
              FluroRouters.router.navigateTo(
                context,
                FavouriteScreen.routeName,
                replace: true,
              );
            },
            leading: Icon(MdiIcons.heart),
            title: Text("Favourite"),
          ),
          ListTile(
            selected: true,
            onTap: () {
              //   setState(() {
              //     aboutColor = true;
              //     contactUsColor = false;
              //     homeColor = false;
              //     profileColor = false;
              //     checkoutColor = false;
              //   });
              //   Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (ctx) => About()));
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: true,
            onTap: () {
              //   setState(() {
              //     aboutColor = false;
              //     contactUsColor = false;
              //     homeColor = false;
              //     profileColor = true;
              //     checkoutColor = false;
              //   });
              //   Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(
              //       builder: (ctx) => ProfileScreen(),
              //     ),
              //   );
              FluroRouters.router.navigateTo(
                context,
                ProfileScreen.routeName,
                replace: true,
              );
            },
            leading: Icon(Icons.info),
            title: Text("Profile"),
          ),
          ListTile(
            selected: true,
            // onTap: () {
            //   setState(() {
            //     contactUsColor = true;
            //     checkoutColor = false;
            //     profileColor = false;
            //     homeColor = false;
            //     aboutColor = false;
            //   });
            //   Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(builder: (ctx) => ContactUs()));
            // },
            leading: Icon(Icons.phone),
            title: Text("Contant Us"),
          ),
          FirebaseAuth.instance.currentUser == null
              ? Container()
              : ListTile(
                  onTap: () {
                    deleteShareprefence();
                    FluroRouters.router.navigateTo(
                      context,
                      LoginSignupScreen.routeName,
                      replace: true,
                    );
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                ),
        ],
      ),
    );
  }
}
