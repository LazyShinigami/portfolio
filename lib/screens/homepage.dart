import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/screens/desktop/desktopHomepage.dart';
import 'package:portfolio/screens/mobile/mobileHomepage.dart';
import 'package:portfolio/screens/tablet/tabletHomepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/progressive tapping.lottie',
            width: 150,
            height: 150,
          ),
        ),
      );
    }

    return const Responsive(
      desktop: DesktopHomepage(),
      mobile: MobileHomepage(),
      tablet: TabletHomepage(),
    );
  }
}
