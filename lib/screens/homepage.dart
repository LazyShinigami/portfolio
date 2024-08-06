import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/screens/desktop/desktopHomepage.dart';
import 'package:portfolio/screens/mobile/mobileHomepage.dart';
import 'package:portfolio/screens/tablet/tabletHomepage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: DesktopHomepage(),
      mobile: MobileHomepage(),
      tablet: TabletHomepage(),
    );
  }
}
