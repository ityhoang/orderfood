// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable

import 'package:apporder/components/drawers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// class Responsive extends StatefulWidget {
//   final Widget desktop;
//   final Widget tablet;
//   final Widget mobile;
//   final GlobalKey<ScaffoldState> keys;
//   const Responsive({
//     Key? key,
//     required this.desktop,
//     required this.tablet,
//     required this.mobile,
//     required this.keys,
//   }) : super(key: key);

//   static bool isDesktop(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     return deviceType == DeviceScreenType.desktop;
//   }

//   static bool isTablet(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     return deviceType == DeviceScreenType.tablet;
//   }

//   static bool isMobile(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     return deviceType == DeviceScreenType.mobile;
//   }

//   static Size getSize(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return size;
//   }

//   @override
//   _ResponsiveState createState() => _ResponsiveState();
// }

// class _ResponsiveState extends State<Responsive> {
//   @override
//   void dispose() {
//     widget.keys.currentState!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(builder: (context, sizeInfo) {
//       if (sizeInfo.deviceScreenType == DeviceScreenType.desktop) {
//         return Scaffold(
//           key: widget.keys,
//           body: widget.desktop,
//         );
//       } else if (sizeInfo.deviceScreenType == DeviceScreenType.tablet) {
//         return Scaffold(
//           key: widget.keys,
//           drawer: buildMyDrawer(),
//           body: widget.tablet,
//         );
//       } else if (sizeInfo.deviceScreenType == DeviceScreenType.mobile) {
//         return Scaffold(
//           key: widget.keys,
//           drawer: buildMyDrawer(),
//           body: widget.mobile,
//         );
//       }
//       return Scaffold(
//         body: Center(
//           child: Text(
//             "Fail",
//           ),
//         ),
//       );
//     });
//   }
// }

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  final GlobalKey<ScaffoldState> keys;
  const Responsive({
    Key? key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
    required this.keys,
  }) : super(key: key);

  static bool isDesktop(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return deviceType == DeviceScreenType.desktop;
  }

  static bool isTablet(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return deviceType == DeviceScreenType.tablet;
  }

  static bool isMobile(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return deviceType == DeviceScreenType.mobile;
  }

  static Size getSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      if (sizeInfo.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
          key: keys,
          body: desktop,
        );
      } else if (sizeInfo.deviceScreenType == DeviceScreenType.tablet) {
        return Scaffold(
          key: keys,
          drawer: Drawers(),
          body: tablet,
        );
      } else if (sizeInfo.deviceScreenType == DeviceScreenType.mobile) {
        return Scaffold(
          key: keys,
          drawer: Drawers(),
          body: mobile,
        );
      }
      return Scaffold(
        body: Center(
          child: Text(
            "Fail",
          ),
        ),
      );
    });
  }
}
