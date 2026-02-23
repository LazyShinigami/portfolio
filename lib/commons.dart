import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Txt extends StatelessWidget {
  final String content;
  final Color color;
  final double size;
  final double spacing;
  final double wordSpacing;
  final List<Shadow> shadowList;
  final FontWeight weight;
  final TextOverflow overflow;
  final int? maxLines;
  final TextAlign? align;
  final FontStyle? fontStyle;

  const Txt(
    this.content, {
    super.key,
    this.color = Colors.black,
    this.size = 16,
    this.spacing = 0,
    this.wordSpacing = 0,
    this.shadowList = const [],
    this.weight = FontWeight.normal,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.align,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'ComicNeue',
        color: color,
        fontSize: size,
        fontStyle: fontStyle,
        letterSpacing: spacing,
        wordSpacing: wordSpacing,
        shadows: shadowList,
        fontWeight: weight,
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.controller,
    required this.label,
    super.key,
    this.obscureText,
    this.hint,
    this.maxLength,
    this.maxLines,
    this.height,
  }) {
    obscureText ??= false;
    maxLines ??= 1;
  }
  TextEditingController controller;
  String label;
  String? hint;
  bool? obscureText = false;
  int? maxLength, maxLines, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (height != null) ? height!.toDouble() : 70,
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          maxLength: (maxLength != null) ? maxLength : null,
          maxLines: (maxLines != null) ? maxLines : null,
          controller: controller,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, letterSpacing: 2),
          obscureText: obscureText!,

          // decoration
          decoration: InputDecoration(
            hintText: ' $hint',
            hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            label: Txt(
              ' $label ',
              size: 14,
              spacing: 2,
              color: const Color(0xFFf3f4ee),
              weight: FontWeight.bold,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFf3f4ee), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFf3f4ee), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedText extends StatelessWidget {
  final String content;
  final Color color;
  final double size;
  final double spacing;
  final double wordSpacing;
  final List<Shadow> shadowList;
  final FontWeight weight;
  final TextOverflow overflow;
  final int? maxLines;
  final TextAlign align;
  final FontStyle? fontStyle;
  final int speed;

  const CustomAnimatedText(
    this.content, {
    super.key,
    this.color = Colors.black,
    this.size = 16,
    this.spacing = 0,
    this.wordSpacing = 0,
    this.shadowList = const [],
    this.weight = FontWeight.normal,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.align = TextAlign.left,
    this.fontStyle,
    this.speed = 100,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(
          content,
          textAlign: align,
          speed: Duration(milliseconds: speed),
          textStyle: TextStyle(
            fontFamily: 'ComicNeue', // ✅ local font
            color: color,
            fontSize: size,
            fontStyle: fontStyle,
            letterSpacing: spacing,
            wordSpacing: wordSpacing,
            shadows: shadowList,
            fontWeight: weight,
          ),
        ),
      ],
    );
  }
}

class RouterClass {
  Route createRoute({required Widget nextScreen}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 750),
      reverseTransitionDuration: const Duration(milliseconds: 750),
    );
  }

  void launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url),
            webOnlyWindowName: url, mode: LaunchMode.inAppWebView);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error while launching url: $e');
    }
  }
}
