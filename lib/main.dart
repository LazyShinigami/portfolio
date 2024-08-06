import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/screens/mobile/mobileProjectPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf3f4ee),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFf3f4ee),
          foregroundColor: Color(0xFFf3f4ee),
          scrolledUnderElevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: MobileProjectPage(
      //   project: ProjectModel(
      //     name: 'Kick Flip',
      //     desc:
      //         'online marketplace for sneaker rsplitHereeselling and demand & supply based sneaker auctioning',
      //     githubLink: 'githubLink',
      //     projectIconURL:
      //         'https://firebasestorage.googleapis.com/v0/b/ritesh-kumar-portfolio.appspot.com/o/projects%2Fkickflip.png?alt=media&token=98c98de8-d8ca-4776-95d6-ba046c95186f',
      //     toolsUsed: ['Flutter', 'Firebase', 'REST APIs'],
      //     availablePlatforms: ['Android', 'iOS'],
      //     tags: ['e-commerce', 'sneaker reselling', 'marketplace'],
      //     features: [
      //       'auction-system',
      //       'secure payments',
      //       'verified products',
      //       'completely demand and supply based pricing system',
      //     ],
      //   ),
      // ),

      home: const Homepage(),
    );
  }
}
