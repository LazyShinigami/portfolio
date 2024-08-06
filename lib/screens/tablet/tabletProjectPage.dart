import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/models/projectsModel.dart';

class TabletProjectPage extends StatefulWidget {
  const TabletProjectPage({super.key, required this.project});
  final ProjectModel project;

  @override
  State<TabletProjectPage> createState() => _TabletProjectPageState();
}

class _TabletProjectPageState extends State<TabletProjectPage> {
  // description preprocessing
  late List processedDesc;
  bool _isGithubLinkHovered = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var x = widget.project.desc.split('splitHere');
    processedDesc = x;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomAnimatedText(
          widget.project.name,
          size: 42,
          weight: FontWeight.bold,
          spacing: 2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 3.5, color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/cross.webp', height: 50, width: 50),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  SizedBox(
                    width: w,
                    height: h - kToolbarHeight,
                    child: Image.network(widget.project.projectIconURL),
                  ),

                  // Project Overview - desc and features
                  Txt(
                    'Project Overview',
                    size: w * 0.05,
                    spacing: 3,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),

                  // Description
                  const SizedBox(height: 10),
                  Txt(
                    'About',
                    size: 18,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < processedDesc.length; i++)
                    Txt(processedDesc[i], size: 16),

                  // Features
                  const SizedBox(height: 10),
                  Txt(
                    'Features',
                    size: 18,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < widget.project.features.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Txt('- ${widget.project.features[i]}', size: 16),
                    ),

                  // Other Details
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column I - Platforms and Tools used
                      SizedBox(
                        width: w * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tools & Technologies
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset('assets/cpu.png'),
                                ),
                                Txt(
                                  ' Tools & Technologies',
                                  size: 18,
                                  spacing: 2,
                                  weight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ],
                            ),
                            for (int i = 0;
                                i < widget.project.toolsUsed.length;
                                i++)
                              Txt(
                                '- ${widget.project.toolsUsed[i]}',
                                size: 16,
                              ),

                            // Platforms Available
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    'assets/platform.png',
                                  ),
                                ),
                                Txt(
                                  ' Platforms Available',
                                  size: 18,
                                  spacing: 2,
                                  weight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ],
                            ),
                            for (int i = 0;
                                i < widget.project.availablePlatforms.length;
                                i++)
                              Txt(
                                '- ${widget.project.availablePlatforms[i]}',
                                size: 16,
                              ),
                          ],
                        ),
                      ),

                      // Column II - Tags and Project Links
                      SizedBox(
                        width: w * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tags
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset('assets/tag.png'),
                                ),
                                Txt(
                                  ' Tags',
                                  size: 18,
                                  spacing: 2,
                                  weight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ],
                            ),
                            for (int i = 0; i < widget.project.tags.length; i++)
                              Txt(
                                '- ${widget.project.tags[i]}',
                                size: 16,
                              ),

                            // Project Links
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    'assets/link.png',
                                  ),
                                ),
                                Txt(
                                  ' Project Link',
                                  size: 18,
                                  spacing: 2,
                                  weight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ],
                            ),
                            MouseRegion(
                              onEnter: (event) => setState(() {
                                _isGithubLinkHovered = true;
                              }),
                              onExit: (event) => setState(() {
                                _isGithubLinkHovered = false;
                              }),
                              child: InkWell(
                                onTap: () {
                                  RouterClass()
                                      .launchURL(widget.project.githubLink);
                                },
                                child: Expanded(
                                  child: AnimatedDefaultTextStyle(
                                    style: TextStyle(
                                      decoration: _isGithubLinkHovered
                                          ? TextDecoration.underline
                                          : null,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    duration: const Duration(milliseconds: 200),
                                    child: Text(
                                      '- ${widget.project.githubLink}',
                                      style:
                                          GoogleFonts.comicNeue(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              // scroll indicator
              Positioned(
                top: h - 150,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/segmentUP.png',
                        height: 75,
                      ),
                      LottieBuilder.asset(
                        'assets/scrollanimation.json',
                        height: 15,
                      ),
                      Image.asset(
                        'assets/segmentDOWN.png',
                        height: 75,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
