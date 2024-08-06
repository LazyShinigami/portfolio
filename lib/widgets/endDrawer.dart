import 'package:flutter/material.dart';
import 'package:portfolio/commons.dart';

class MyEndDrawer extends StatelessWidget {
  MyEndDrawer(
      {super.key, required this.width, required this.keyMap, this.fontSize}) {
    fontSize ??= 16;
  }
  final Map keyMap;
  double? fontSize;

  final double width;
  void _scrollToSection(GlobalKey sectionKey) {
    Scrollable.ensureVisible(
      sectionKey.currentContext!,
      duration: const Duration(
          milliseconds: 750), // Adjust duration for smooth scrolling
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            // About Me
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(keyMap['introSectionKey']);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.person,
                        size: (fontSize != 16) ? fontSize! + 4 : 20),
                    const SizedBox(width: 10),
                    Txt('About Me',
                        weight: FontWeight.bold, spacing: 2, size: fontSize)
                  ],
                ),
              ),
            ),
            const Divider(),

            // Projects
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(keyMap['projectsSectionKey']);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.work_rounded,
                        size: (fontSize != 16) ? fontSize! + 4 : 20),
                    const SizedBox(width: 10),
                    Txt('My Works',
                        weight: FontWeight.bold, spacing: 2, size: fontSize)
                  ],
                ),
              ),
            ),
            const Divider(),

            // Skills
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(keyMap['skillsSectionKey']);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.settings_rounded,
                        size: (fontSize != 16) ? fontSize! + 4 : 20),
                    const SizedBox(width: 10),
                    Txt('My Skills',
                        weight: FontWeight.bold, spacing: 2, size: fontSize)
                  ],
                ),
              ),
            ),
            const Divider(),

            // Resume
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(keyMap['introSectionKey']);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.download_rounded,
                        size: (fontSize != 16) ? fontSize! + 4 : 20),
                    const SizedBox(width: 10),
                    Txt('Download Resume',
                        weight: FontWeight.bold, spacing: 2, size: fontSize)
                  ],
                ),
              ),
            ),
            const Divider(),

            // E-mail Me
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(keyMap['contactMeSectionKey']);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.email_rounded,
                        size: (fontSize != 16) ? fontSize! + 4 : 20),
                    const SizedBox(width: 10),
                    Txt('E-mail Me',
                        weight: FontWeight.bold, spacing: 2, size: fontSize)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
