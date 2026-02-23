import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/backend/emailService.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/backend/projectsManager.dart';
import 'package:portfolio/backend/skillsManager.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/screens/desktop/desktopProjectPage.dart';
import 'package:portfolio/widgets/drawerIcon.dart';
import 'package:portfolio/widgets/endDrawer.dart';
import 'package:portfolio/widgets/shadowButton.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopHomepage extends StatefulWidget {
  const DesktopHomepage({super.key});

  @override
  State<DesktopHomepage> createState() => _DesktopHomepageState();
}

class _DesktopHomepageState extends State<DesktopHomepage> {
  bool _isDownloadButtonHovered = false;

  void _scrollToSection(GlobalKey sectionKey) {
    Scrollable.ensureVisible(
      sectionKey.currentContext!,
      duration: const Duration(
          milliseconds: 750), // Adjust duration for smooth scrolling
      curve: Curves.easeInOut,
    );
  }

  final GlobalKey introSectionKey = GlobalKey();
  final GlobalKey projectsSectionKey = GlobalKey();
  final GlobalKey skillsSectionKey = GlobalKey();
  final GlobalKey contactMeSectionKey = GlobalKey();

  final projectsList = ProjectsManager().projects;
  final skillsList = Skillsmanager().skills;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: MyEndDrawer(
        width: w * 0.25,
        keyMap: {
          'introSectionKey': introSectionKey,
          'projectsSectionKey': projectsSectionKey,
          'skillsSectionKey': skillsSectionKey,
          'contactMeSectionKey': contactMeSectionKey,
        },
      ),
      appBar: AppBar(
        actions: const [
          DrawerIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Intro Section
            Stack(
              key: introSectionKey,
              alignment: Alignment.center,
              children: [
                Center(child: BigCircle()),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  height: h,
                  width: w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Intro Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // name
                          const Txt(' Hi, I\'m', weight: FontWeight.bold),
                          const CustomAnimatedText(
                            'Ritesh Kumar',
                            size: 60,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          // about
                          const CustomAnimatedText(
                            'AI & ML Developer,',
                            size: 40,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          const CustomAnimatedText(
                            'Flutter Developer',
                            size: 40,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          // interests
                          const SizedBox(height: 15),
                          const Txt(
                            '~ AI / ML enthusiast',
                            spacing: 2,
                          ),
                          const Txt(
                            '~ mobile app developer',
                            spacing: 2,
                          ),
                          const Txt(
                            '~ solving problems with code',
                            spacing: 2,
                          ),
                          // view all projects button
                          const SizedBox(height: 15),
                          ShadowButton(
                            child: InkWell(
                              onTap: () {
                                _scrollToSection(projectsSectionKey);
                              },
                              child: Container(
                                width: 200,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  color: const Color(0xFFf3f4ee),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Txt('SEE MY WORK  ', size: 14, spacing: 2),
                                    Icon(Icons.arrow_forward, size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // socials links
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  RouterClass().launchURL(
                                      'https://github.com/LazyShinigami');
                                },
                                child:
                                    const Txt(' GitHub ', spacing: 1, size: 14),
                              ),
                              const Txt(' / '),
                              InkWell(
                                onTap: () {
                                  RouterClass().launchURL(
                                      'https://www.linkedin.com/in/ritesh-kumar-482824239/');
                                },
                                child: Txt(' LinkedIn ', spacing: 1, size: 14),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Terminal Window
                      TerminalWindow(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Txt(
                              '\$ portfolio/ritesh ~ find / name-"resume.pdf"',
                              color: Colors.white,
                              size: 14,
                              spacing: 1.5,
                            ),
                            const SizedBox(height: 15),
                            const Txt(
                              '> Searching . . .',
                              color: Colors.grey,
                              size: 14,
                              spacing: 1.5,
                            ),
                            const SizedBox(height: 15),
                            const Txt(
                              '> file found',
                              color: Colors.green,
                              size: 14,
                              spacing: 1.5,
                            ),
                            const SizedBox(height: 15),

                            // download resume option
                            MouseRegion(
                              onEnter: (event) => setState(() {
                                _isDownloadButtonHovered = true;
                              }),
                              onExit: (event) => setState(() {
                                _isDownloadButtonHovered = false;
                              }),
                              child: AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  letterSpacing:
                                      _isDownloadButtonHovered ? 2 : 1.5,
                                ),
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  onTap: () {
                                    const filePath =
                                        'assets/resume/Ritesh_Kumar_Resume.pdf';

                                    // Open in a new browser tab
                                    html.window.open(filePath, '_blank');
                                  },
                                  child: const Txt(
                                    '> click here to download my resume',
                                    size: 14,
                                    color: Colors.green,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Projects Section
            Container(
              key: projectsSectionKey,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              // crafted with love msg
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Txt(
                        'Crafted with Love',
                        size: 55,
                        spacing: 3,
                        weight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < projectsList.length; i++)
                    ProjectTileWidget(index: i, projectSet: projectsList),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      RouterClass().launchURL(
                          'https://github.com/LazyShinigami?tab=repositories');
                    },
                    child: const Txt(
                      '  Click here to view all my projects on GitHub >  ',
                      spacing: 2.5,
                      wordSpacing: 5,
                      size: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            // Skills Section
            const SizedBox(height: 20),
            Padding(
              key: skillsSectionKey,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    'Skills in My Backpack',
                    size: 55,
                    spacing: 3,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Icon(
                        Icons.settings_suggest_rounded,
                        size: 200,
                        color: Color.fromARGB(86, 158, 158, 158),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column I - Languages, Core Concepts, Version Control
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkillSectionByType(
                              category: 'Languages', skillSet: skillsList),
                          const SizedBox(height: 20),
                          SkillSectionByType(
                              category: 'Core Concepts', skillSet: skillsList),
                          const SizedBox(height: 20),
                          SkillSectionByType(
                              category: 'Ongoing...', skillSet: skillsList),
                        ],
                      ),

                      // Column II - Front-end, Back-end, Ongoing
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkillSectionByType(
                              category: 'Front-End', skillSet: skillsList),
                          const SizedBox(height: 20),
                          SkillSectionByType(
                              category: 'Back-End', skillSet: skillsList),
                          const SizedBox(height: 20),
                          SkillSectionByType(
                              category: 'Version Control',
                              skillSet: skillsList),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // E-mail me section
            EmailSection(key: contactMeSectionKey),
          ],
        ),
      ),
    );
  }
}

class EmailSection extends StatefulWidget {
  const EmailSection({
    super.key,
  });

  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final messageController = TextEditingController();

  bool _isSendButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(58, 0, 0, 0),
            offset: Offset(-10, 0),
            blurRadius: 150,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          // E-mail section
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 50, horizontal: (w * 0.2 > 20) ? w * 0.2 : 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Txt(
                      'Want to get in touch? Send an e-mail!',
                      size: 24,
                      spacing: 2,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        controller: nameController,
                        label: 'Name',
                        hint: 'Your Name',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: MyTextField(
                        controller: emailController,
                        label: 'E-mail',
                        hint: 'Your E-mail Address',
                      ),
                    ),
                  ],
                ),
                MyTextField(
                  controller: messageController,
                  label: 'Message',
                  hint: 'Type your message here...',
                  maxLines: 15,
                  maxLength: 300,
                  height: 200,
                ),
                const SizedBox(height: 20),

                // Send Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isSendButtonHovered = true;
                      }),
                      onExit: (_) => setState(() {
                        _isSendButtonHovered = false;
                      }),
                      child: GestureDetector(
                        onTap: () async {
                          bool status = false;
                          if (nameController.text.trim().isNotEmpty &&
                              emailController.text.trim().isNotEmpty &&
                              messageController.text.trim().isNotEmpty) {
                            status = await EmailService().sendEmail(
                              email: emailController.text.trim(),
                              name: nameController.text.trim(),
                              message: messageController.text.trim(),
                            );
                          }
                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFFf3f4ee),
                              content: Txt(
                                (status)
                                    ? 'E-mail Sent!'
                                    : 'Failed to send e-mail. Please provide all details!',
                                size: 14,
                                spacing: 2,
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x52F3F4EE),
                                spreadRadius: 0.0,
                                blurStyle: BlurStyle.outer,
                                offset: _isSendButtonHovered
                                    ? const Offset(0, 0)
                                    : const Offset(5, 5),
                              ),
                            ],
                            color: const Color(0xFFf3f4ee),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Txt(
                                'Send ',
                                spacing: 1,
                                weight: FontWeight.bold,
                                size: 14,
                              ),
                              Icon(
                                Icons.send_rounded,
                                color: Colors.black,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Credits section
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  RouterClass().launchURL('https://ye-lwin-oo.vercel.app/');
                },
                child: const Txt(
                  '   The design for this website was inspired by Ye Lwin Wo\'s portfolio website',
                  color: Color(0x709E9E9E),
                  size: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectTileWidget extends StatelessWidget {
  const ProjectTileWidget(
      {super.key, required this.index, required this.projectSet});
  final int index;
  final List<ProjectModel> projectSet;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          if (index % 2 != 0) const SizedBox(width: 40),
          // graphics section
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: w * 0.4,
                height: w * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFc6d3b7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: w * 0.175,
                      width: w * 0.175,
                      // CHANGES HERE ---------------------------
                      // child: Image.network(
                      //   projectSet[index].projectIconURL,
                      //   fit: BoxFit.cover,
                      // ),
                      child: (projectSet[index].rotateIcon!)
                          ? Transform.rotate(
                              angle: -10 * 3.141592653589793 / 180,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  projectSet[index].projectIconURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                projectSet[index].projectIconURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: w * 0.4,
                height: w * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0x32C6D3B7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Txt(
                      '0${index + 1}',
                      fontStyle: FontStyle.italic,
                      size: 82,
                      weight: FontWeight.bold,
                      spacing: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // project details
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: w * 0.11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // title
                  Txt(
                    projectSet[index].name,
                    size: w * 0.02,
                    spacing: 2,
                    weight: FontWeight.bold,
                  ),

                  // desc
                  Txt(
                    projectSet[index].desc,
                    maxLines: 2,
                    spacing: 1,
                    overflow: TextOverflow.ellipsis,
                    size: 15.78,
                    align: TextAlign.right,
                  ),

                  // view project button
                  const SizedBox(height: 7.8),
                  ShadowButton(
                    width: 150,
                    offset: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          RouterClass().createRoute(
                            nextScreen: DesktopProjectPage(
                              project: projectSet[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          color: const Color(0xFFf3f4ee),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Txt('View Project ', size: 13, spacing: 2),
                            Icon(Icons.arrow_forward, size: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillSectionByType extends StatefulWidget {
  const SkillSectionByType(
      {super.key, required this.category, required this.skillSet});
  final String category;
  final List<SkillModel> skillSet;
  @override
  State<SkillSectionByType> createState() => _SkillSectionByTypeState();
}

class _SkillSectionByTypeState extends State<SkillSectionByType> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          widget.category,
          weight: FontWeight.bold,
          spacing: 1,
          size: 18,
        ),
        const SizedBox(height: 5),
        for (int i = 0; i < widget.skillSet.length; i++)
          if (widget.skillSet[i].category == widget.category)
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Txt(widget.skillSet[i].name, spacing: 2),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 3,
                      child: Center(
                        child: Container(
                          height: 1,
                          width: 200,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    VisibilityDetector(
                      key: Key('skill-${widget.skillSet[i].name}'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0) {
                          setState(() {
                            _isExpanded = true;
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 750),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black,
                        ),
                        height: 3,
                        width: _isExpanded ? widget.skillSet[i].level * 2 : 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ],
    );
  }
}

class TerminalWindow extends StatelessWidget {
  const TerminalWindow({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 225,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF010000),
        boxShadow: const [
          BoxShadow(
            color: Color(0x7D010000),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(30, 30),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu Panel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow[600],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[600],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class BigCircle extends StatefulWidget {
  BigCircle({super.key});

  @override
  State<BigCircle> createState() => _BigCircleState();
}

class _BigCircleState extends State<BigCircle> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation when the widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: _isExpanded ? 400 : 0,
        width: _isExpanded ? 400 : 0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(64, 158, 158, 158),
              blurStyle: BlurStyle.outer,
              blurRadius: 50,
            ),
          ],
        ),
      ),
    );
  }
}
