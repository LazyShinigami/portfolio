import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/models/projectsModel.dart';

class MobileProjectPage extends StatefulWidget {
  const MobileProjectPage({super.key, required this.project});
  final ProjectModel project;

  @override
  State<MobileProjectPage> createState() => _MobileProjectPageState();
}

class _MobileProjectPageState extends State<MobileProjectPage> {
  // description preprocessing
  late List processedDesc;
  bool _isGithubLinkHovered = false;
  @override
  void initState() {
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
          size: 20,
          weight: FontWeight.bold,
          spacing: 2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/cross.webp', height: 25, width: 25),
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
                    child: Image.asset(widget.project.projectIlltURL),
                  ),

                  // Project Overview - desc and features
                  const Txt(
                    'Project Overview',
                    size: 20,
                    spacing: 3,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),

                  // Description
                  const SizedBox(height: 10),
                  const Txt(
                    'About',
                    size: 16,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < processedDesc.length; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFE5E5E4)),
                      child: Txt(processedDesc[i], size: 14),
                    ),

                  // Features
                  const SizedBox(height: 10),
                  const Txt(
                    'Features',
                    size: 16,
                    spacing: 2,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  for (int i = 0; i < widget.project.features.length; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFE5E5E4)),
                      child: Txt('- ${widget.project.features[i]}', size: 14),
                    ),

                  // Other Details
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Tools & Technologies
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Image.asset('assets/cpu.png'),
                          ),
                          const Txt(
                            ' Tools & Technologies',
                            size: 16,
                            spacing: 2,
                            weight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ],
                      ),
                      for (int i = 0; i < widget.project.toolsUsed.length; i++)
                        Txt(
                          '- ${widget.project.toolsUsed[i]}',
                          size: 14,
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
                            (widget.project.availablePlatforms == null ||
                                    widget.project.availablePlatforms!.isEmpty)
                                ? ' Evaluation'
                                : ' Platforms Available',
                            size: 16,
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
                          Txt('- ${widget.project.evaluation![i]}', size: 14)
                      else
                        for (int i = 0;
                            i < widget.project.availablePlatforms!.length;
                            i++)
                          Txt('- ${widget.project.availablePlatforms![i]}',
                              size: 14),

                      // Tags
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Image.asset('assets/tag.png'),
                          ),
                          const Txt(
                            ' Tags',
                            size: 16,
                            spacing: 2,
                            weight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ],
                      ),
                      for (int i = 0; i < widget.project.tags.length; i++)
                        Txt(
                          '- ${widget.project.tags[i]}',
                          size: 14,
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
                          const Txt(
                            ' Project Link',
                            size: 16,
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
                            RouterClass().launchURL(widget.project.githubLink);
                          },
                          child: AnimatedDefaultTextStyle(
                            style: TextStyle(
                              decoration: _isGithubLinkHovered
                                  ? TextDecoration.underline
                                  : null,
                              overflow: TextOverflow.ellipsis,
                            ),
                            duration: const Duration(milliseconds: 200),
                            child: Txt(
                              '- ${widget.project.githubLink}',
                              size: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
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
