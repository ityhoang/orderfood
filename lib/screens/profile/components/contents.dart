// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/utils/custom.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  final TextEditingController emailS = TextEditingController();
  final TextEditingController passwordS = TextEditingController();
  final TextEditingController yourNameS = TextEditingController();
  String pathavt = "https://tyhoang.ga/images/uploads/avt.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe3e9ef),
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 50.0 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 1200,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 180,
                    child: Container(
                      color: Color(0xFF2C3C4E),
                    ),
                  ),
                ),
                Responsive.isDesktop(context)
                    ? Positioned(
                        top: 180 / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Thông Tin Hồ Sơ",
                                style: TextStyle(
                                    fontSize: 24, color: Color(0xFFEEEEEE)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 500,
                              child: Container(
                                width: Responsive.getSize(context).width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, left: 13, bottom: 30),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 45.0,
                                            backgroundImage:
                                                NetworkImage(pathavt),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Tyhoang"),
                                              Container(
                                                width:
                                                    (Responsive.getSize(context)
                                                                .width *
                                                            0.25) *
                                                        0.5,
                                                child: Text(
                                                  "tyhoang@gmail.com",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: Responsive.getSize(context).width *
                                          0.25,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13, vertical: 20),
                                        child: Text(
                                          'Đơn hàng',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFA8A8A8)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Responsive.getSize(context).width *
                                          0.25,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13, vertical: 20),
                                        child: Text(
                                          'Sản phẩm yêu thích',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFA8A8A8)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Responsive.getSize(context).width *
                                          0.25,
                                      height: 50,
                                      color: Color(0xFFf6f9fc),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 13, top: 15, bottom: 15),
                                        child: Text("Cài đặt tài khoản"),
                                      ),
                                    ),
                                    Container(
                                      width: Responsive.getSize(context).width *
                                          0.25,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13, vertical: 20),
                                        child: Text(
                                          'Thông tin cá nhân',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFA8A8A8)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Responsive.getSize(context).width *
                                          0.25,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13, vertical: 20),
                                        child: Text(
                                          'Địa chỉ giao nhận',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFA8A8A8)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 20),
                                      child: Text("Đăng xuất"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                    : Container(),
                Responsive.isDesktop(context)
                    ? Positioned(
                        top: 220,
                        right: 40,
                        child: SizedBox(
                          height: 600,
                          child: Container(
                            width: Responsive.isDesktop(context)
                                ? Responsive.getSize(context).width * 0.7 - 100
                                : Responsive.getSize(context).width * 0.95,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 45.0,
                                        backgroundImage: NetworkImage(pathavt),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      RaisedButton.icon(
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles();
                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;
                                            print(file.name);
                                            String name = file.name;
                                            List<String> newname =
                                                name.split(".");
                                            String base64 =
                                                uint8ListTob64(file.bytes!);
                                            String url =
                                                "https://tyhoang.ga/images/api_image.php";
                                            final response = await http
                                                .post(Uri.parse(url), body: {
                                              "base64": base64,
                                              "name": name
                                            });
                                            if (response.body.toString() ==
                                                "1") {
                                              setState(() {
                                                pathavt =
                                                    "https://tyhoang.ga/images/uploads/" +
                                                        newname[0] +
                                                        ".png";
                                              });
                                            }
                                          } else {
                                            return;
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        label: Text(
                                          'Change avatar',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        icon: Icon(
                                          Icons.android,
                                          color: Colors.blue,
                                        ),
                                        textColor: Colors.white,
                                        splashColor: Colors.red,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Color(0xFFA8A8A8)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text("Full Name:"),
                                          ),
                                          buildTextField(
                                              FontAwesomeIcons.userAlt,
                                              "Your Name",
                                              false,
                                              false,
                                              Responsive.isDesktop(context)
                                                  ? (Responsive.getSize(context)
                                                                  .width *
                                                              0.7 -
                                                          100) *
                                                      0.4
                                                  : (Responsive.getSize(context)
                                                              .width *
                                                          0.7) *
                                                      0.4,
                                              yourNameS,
                                              true),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text("Email:"),
                                          ),
                                          buildTextField(
                                              FontAwesomeIcons.envelope,
                                              "Email",
                                              false,
                                              true,
                                              Responsive.isDesktop(context)
                                                  ? (Responsive.getSize(context)
                                                                  .width *
                                                              0.7 -
                                                          100) *
                                                      0.4
                                                  : (Responsive.getSize(context)
                                                              .width *
                                                          0.7) *
                                                      0.4,
                                              emailS,
                                              false),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text("Change Password:"),
                                          ),
                                          buildTextField(
                                              FontAwesomeIcons.lock,
                                              "Password",
                                              true,
                                              false,
                                              Responsive.isDesktop(context)
                                                  ? (Responsive.getSize(context)
                                                                  .width *
                                                              0.7 -
                                                          100) *
                                                      0.4
                                                  : (Responsive.getSize(context)
                                                              .width *
                                                          0.7) *
                                                      0.4,
                                              passwordS,
                                              true),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text("Change Number-Phone:"),
                                          ),
                                          buildTextField(
                                              FontAwesomeIcons.userAlt,
                                              "Your Name",
                                              false,
                                              false,
                                              Responsive.isDesktop(context)
                                                  ? (Responsive.getSize(context)
                                                                  .width *
                                                              0.7 -
                                                          100) *
                                                      0.4
                                                  : (Responsive.getSize(context)
                                                              .width *
                                                          0.7) *
                                                      0.4,
                                              yourNameS,
                                              true),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text("Change Address:"),
                                          ),
                                          buildTextField(
                                              FontAwesomeIcons.envelope,
                                              "Email",
                                              false,
                                              true,
                                              Responsive.isDesktop(context)
                                                  ? (Responsive.getSize(context)
                                                                  .width *
                                                              0.7 -
                                                          100) *
                                                      0.4
                                                  : (Responsive.getSize(context)
                                                              .width *
                                                          0.7) *
                                                      0.4,
                                              emailS,
                                              true),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      print('Button Clicked.');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text(
                                      'Save Change',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    textColor: Colors.white,
                                    splashColor: Colors.red,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        top: 220,
                        right: 15,
                        left: 15,
                        child: SizedBox(
                          height: 850,
                          child: Container(
                            width: Responsive.getSize(context).width * 0.95,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 45.0,
                                        backgroundImage: NetworkImage(pathavt),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      RaisedButton.icon(
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(withData: true);
                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;
                                            String name = file.name;
                                            List<String> newname =
                                                name.split(".");
                                            String base64 =
                                                uint8ListTob64(file.bytes!);
                                            String url =
                                                "https://tyhoang.ga/images/api_image.php";
                                            final response = await http
                                                .post(Uri.parse(url), body: {
                                              "base64": base64,
                                              "name": name
                                            });
                                            if (response.body.toString() ==
                                                "1") {
                                              setState(() {
                                                pathavt =
                                                    "https://tyhoang.ga/images/uploads/" +
                                                        newname[0] +
                                                        ".png";
                                              });
                                            }
                                          } else {
                                            return;
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        label: Text(
                                          'Change avatar',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        icon: Icon(
                                          Icons.android,
                                          color: Colors.blue,
                                        ),
                                        textColor: Colors.white,
                                        splashColor: Colors.red,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Color(0xFFA8A8A8)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text("Full Name:"),
                                      ),
                                      buildTextField(
                                          FontAwesomeIcons.userAlt,
                                          "Your Name",
                                          false,
                                          false,
                                          Responsive.getSize(context).width *
                                              0.95,
                                          yourNameS,
                                          true),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text("Email:"),
                                      ),
                                      buildTextField(
                                          FontAwesomeIcons.envelope,
                                          "Email",
                                          false,
                                          true,
                                          Responsive.getSize(context).width *
                                              0.95,
                                          emailS,
                                          false),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text("Change Password:"),
                                      ),
                                      buildTextField(
                                          FontAwesomeIcons.lock,
                                          "Password",
                                          true,
                                          false,
                                          Responsive.getSize(context).width *
                                              0.95,
                                          passwordS,
                                          true),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text("Change Number-Phone:"),
                                      ),
                                      buildTextField(
                                          FontAwesomeIcons.userAlt,
                                          "Your Name",
                                          false,
                                          false,
                                          Responsive.getSize(context).width *
                                              0.95,
                                          yourNameS,
                                          true),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text("Change Address:"),
                                      ),
                                      buildTextField(
                                          FontAwesomeIcons.envelope,
                                          "Email",
                                          false,
                                          true,
                                          Responsive.getSize(context).width *
                                              0.95,
                                          emailS,
                                          true),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      print('Button Clicked.');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text(
                                      'Save Change',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    textColor: Colors.white,
                                    splashColor: Colors.red,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      IconData icon,
      String hintText,
      bool isPassword,
      bool isEmail,
      double width,
      TextEditingController controller,
      bool checkT) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Color(0x70000000),
                offset: Offset(-2.2, 2.6),
                blurRadius: 2,
              ),
              BoxShadow(
                color: Color(0x85D3CFCF),
                offset: -Offset(3, 1.5),
                blurRadius: 2,
              ),
            ]),
        child: TextField(
          enabled: checkT,
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Palette.iconColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
          ),
        ),
      ),
    );
  }

  String uint8ListTob64(Uint8List uint8list) {
    String base64String = base64Encode(uint8list);
    String header = "data:image/png;base64,";
    return header + base64String;
  }
}
