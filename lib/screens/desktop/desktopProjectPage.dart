import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/models/projectsModel.dart';

class DesktopProjectPage extends StatefulWidget {
  const DesktopProjectPage({super.key, required this.project});
  final ProjectModel project;

  @override
  State<DesktopProjectPage> createState() => _DesktopProjectPageState();
}

class _DesktopProjectPageState extends State<DesktopProjectPage> {
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
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  SizedBox(
                    width: w,
                    height: h - kToolbarHeight,
                    child: Image.asset(widget.project.projectIlltURL),
                  ),
                  const SizedBox(height: 30),
                  // Project Overview - desc and features
                  const Txt(
                    'Project Overview',
                    size: 32,
                    spacing: 3,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),

                  // Description
                  const SizedBox(height: 10),
                  const Txt(
                    'About',
                    size: 22,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < processedDesc.length; i++)
                    Txt(processedDesc[i], size: 18),

                  // Features
                  const SizedBox(height: 10),
                  const Txt(
                    'Features',
                    size: 22,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < widget.project.features.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 10),
                      child: Txt('- ${widget.project.features[i]}', size: 18),
                    ),

                  // Other Details
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column I - Platforms and Tools used
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tools & Technologies
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset('assets/cpu.png'),
                              ),
                              const Txt(
                                ' Tools & Technologies',
                                size: 22,
                                spacing: 2,
                                weight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          ),
                          for (int i = 0;
                              i < widget.project.toolsUsed.length;
                              i++)
                            Txt('- ${widget.project.toolsUsed[i]}', size: 18),

                          // Platforms Available
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  'assets/platform.png',
                                ),
                              ),
                              Txt(
                                (widget.project.availablePlatforms == null ||
                                        widget.project.availablePlatforms!
                                            .isEmpty)
                                    ? ' Evaluation'
                                    : ' Platforms Available',
                                size: 22,
                                spacing: 2,
                                weight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          ),
                          if (widget.project.availablePlatforms == null ||
                              widget.project.availablePlatforms!.isEmpty)
                            for (int i = 0;
                                i < widget.project.evaluation!.length;
                                i++)
                              Txt('- ${widget.project.evaluation![i]}',
                                  size: 18)
                          else
                            for (int i = 0;
                                i < widget.project.availablePlatforms!.length;
                                i++)
                              Txt('- ${widget.project.availablePlatforms![i]}',
                                  size: 18),
                        ],
                      ),

                      // Column II - Tags and Project Links
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tags
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset('assets/tag.png'),
                              ),
                              const Txt(
                                ' Tags',
                                size: 22,
                                spacing: 2,
                                weight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          ),
                          for (int i = 0; i < widget.project.tags.length; i++)
                            Txt('- ${widget.project.tags[i]}', size: 18),

                          // Project Links
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  'assets/link.png',
                                ),
                              ),
                              const Txt(
                                ' Project Link',
                                size: 22,
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
                              child: AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  decoration: _isGithubLinkHovered
                                      ? TextDecoration.underline
                                      : null,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                duration: const Duration(milliseconds: 200),
                                child: Txt('- ${widget.project.githubLink}',
                                    overflow: TextOverflow.ellipsis, size: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              // scroll indicator
              Positioned(
                top: h - 200,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/segmentUP.png',
                      height: 125,
                    ),
                    LottieBuilder.asset(
                      'assets/scrollanimation.json',
                      height: 26,
                    ),
                    Image.asset(
                      'assets/segmentDOWN.png',
                      height: 125,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
