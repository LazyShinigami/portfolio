import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});
  final Widget mobile, tablet, desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 501;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 501 &&
      MediaQuery.of(context).size.width < 1000;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isMobile(context)) {
      return mobile;
    } else {
      return tablet;
    }
  }
}
