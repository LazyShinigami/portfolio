import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/backend/emailService.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/backend/projectsManager.dart';
import 'package:portfolio/backend/skillsManager.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/screens/mobile/mobileProjectPage.dart';
import 'package:portfolio/widgets/drawerIcon.dart';
import 'package:portfolio/widgets/endDrawer.dart';
import 'package:portfolio/widgets/shadowButton.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({super.key});

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  bool _isDownloadButtonHovered = false;

  void _scrollToSection(GlobalKey sectionKey) {
    Scrollable.ensureVisible(
      sectionKey.currentContext!,
      duration: const Duration(
          milliseconds: 750), // Adjust duration for smooth scrolling
      curve: Curves.easeInOut,
    );
  }

  final projectsList = ProjectsManager().projects;
  final skillsList = Skillsmanager().skills;

  final GlobalKey introSectionKey = GlobalKey();
  final GlobalKey projectsSectionKey = GlobalKey();
  final GlobalKey skillsSectionKey = GlobalKey();
  final GlobalKey contactMeSectionKey = GlobalKey();

  final GlobalKey skillsSectionInnerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: MyEndDrawer(
        fontSize: 13,
        width: w * 0.75,
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
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      // Intro Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // name
                          Txt(
                            'Hi, I\'m',
                            weight: FontWeight.bold,
                            size: 13,
                          ),
                          CustomAnimatedText(
                            'Ritesh Kumar',
                            size: 26,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          // about
                          CustomAnimatedText(
                            'Flutter Developer,',
                            size: 20,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          CustomAnimatedText(
                            'AI & ML Enthusiast',
                            size: 20,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          // interests
                          const SizedBox(height: 15),
                          Txt(
                            '~ passionate mobile app developer',
                            spacing: 2,
                            size: 14,
                          ),
                          Txt(
                            '~ avid reader',
                            spacing: 2,
                            size: 14,
                          ),
                          Txt(
                            '~ tech enthusiast',
                            spacing: 2,
                            size: 14,
                          ),
                          // view projects button
                          const SizedBox(height: 15),
                          ShadowButton(
                            width: 125,
                            child: InkWell(
                              onTap: () {
                                _scrollToSection(projectsSectionKey);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  color: const Color(0xFFf3f4ee),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Txt('SEE MY WORK ', size: 10, spacing: 1),
                                    const Icon(
                                      Icons.arrow_forward,
                                      size: 13,
                                    ),
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
                                child: Txt(' GitHub ', spacing: 1, size: 13),
                              ),
                              Txt(' / '),
                              InkWell(
                                onTap: () {
                                  RouterClass().launchURL(
                                      'https://www.linkedin.com/in/ritesh-kumar-482824239/');
                                },
                                child: Txt(' LinkedIn ', spacing: 1, size: 13),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Terminal Window
                      const SizedBox(height: 20),
                      TerminalWindow(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$ portfolio/ritesh ~ find / name-"resume.pdf"',
                              style: GoogleFonts.comicNeue(
                                color: Colors.white,
                                fontSize: 12.5,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '> Searching . . .',
                              style: GoogleFonts.comicNeue(
                                color: Colors.grey,
                                fontSize: 12.5,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '> file found',
                              style: GoogleFonts.comicNeue(
                                color: Colors.green,
                                fontSize: 12.5,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 15),
                            AnimatedDefaultTextStyle(
                              style: TextStyle(
                                letterSpacing:
                                    _isDownloadButtonHovered ? 1.5 : 1,
                              ),
                              duration: const Duration(milliseconds: 200),
                              child: InkWell(
                                onTap: () async {
                                  // getting the  download url for the resume
                                  String url = await FirebaseStorage.instance
                                      .ref('Ritesh Kumar - Resume.pdf')
                                      .getDownloadURL();
                                  RouterClass().launchURL(url);
                                },
                                child: MouseRegion(
                                  onEnter: (event) => setState(() {
                                    _isDownloadButtonHovered = true;
                                  }),
                                  onExit: (event) => setState(() {
                                    _isDownloadButtonHovered = false;
                                  }),
                                  child: Text(
                                    '> click here to download my resume',
                                    style: GoogleFonts.comicNeue(
                                      color: Colors.green,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                    ),
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
            Padding(
              key: projectsSectionKey,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // crafted with love msg
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Txt(
                        'Crafted with Love',
                        size: 20,
                        spacing: 2.5,
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
                    child: Txt(
                      '  Click here to view all my projects on GitHub >  ',
                      spacing: 1,
                      wordSpacing: 2,
                      size: 8,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Skills Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        'Skills in My Backpack',
                        size: 20,
                        spacing: 2.5,
                        weight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Languages', skillSet: skillsList),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Core Concepts', skillSet: skillsList),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Ongoing...', skillSet: skillsList),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Front-End', skillSet: skillsList),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Back-End', skillSet: skillsList),
                      const SizedBox(height: 20),
                      SkillSectionByType(
                          category: 'Version Control', skillSet: skillsList),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // Tools I Use Section
            // const SizedBox(height: 20),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Txt(
            //         'Tools I Use to Do Magic',
            //         size: 55,
            //         spacing: 3,
            //         weight: FontWeight.bold,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ],
            //   ),
            // ),
            // VS Code
            // Chrome
            // All Powerful CLI
            // Ubuntu

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
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Txt(
                        'Want to get in touch? Send an e-mail!',
                        size: 18,
                        maxLines: 2,
                        spacing: 2,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
                      width: 10,
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
                const SizedBox(height: 10),
                MyTextField(
                  // height: 40,
                  controller: messageController,
                  label: 'Message',
                  hint: 'Type your message here...',
                  maxLines: 15,
                  maxLength: 300,
                  height: 150,
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
                                size: 12,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Txt(
                                'Send ',
                                spacing: 1,
                                weight: FontWeight.bold,
                                size: 14,
                              ),
                              const Icon(
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
                child: Txt(
                  ' The design for this website was inspired by Ye Lwin Wo\'s portfolio website',
                  color: const Color(0x709E9E9E),
                  size: 9,
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
          if (index % 2 != 0) const SizedBox(width: 15),
          // graphics section
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: w * 0.4,
                height: w * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFc6d3b7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: w * 0.3,
                      width: w * 0.3,
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: w * 0.4,
                height: w * 0.25,
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
                      size: w * 0.035,
                      weight: FontWeight.bold,
                      spacing: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // project details
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // title
                Txt(
                  projectSet[index].name,
                  size: 13,
                  spacing: 2,
                  weight: FontWeight.bold,
                ),

                // // desc
                // Txt(
                //   projectSet[index].desc,
                //   maxLines: 2,
                //   spacing: 1,
                //   overflow: TextOverflow.ellipsis,
                //   size: 15.78,
                //   align: TextAlign.right,
                // ),

                // view project button
                const SizedBox(height: 2.5),
                ShadowButton(
                  width: 100,
                  offset: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        RouterClass().createRoute(
                          nextScreen: MobileProjectPage(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Txt('View Project', size: 10, spacing: 2),
                          Icon(Icons.arrow_forward,
                              size: (w * 0.02 + 3 > 14) ? 14 : w * 0.02 + 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
    // double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          widget.category,
          weight: FontWeight.bold,
          spacing: 1,
          size: 16,
        ),
        const SizedBox(height: 5),
        for (int i = 0; i < widget.skillSet.length; i++)
          if (widget.skillSet[i].category == widget.category)
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Txt(widget.skillSet[i].name, size: 14, spacing: 1.8),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 3,
                      child: Center(
                        child: Container(
                          height: 1,
                          width: 150,
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
                        width:
                            _isExpanded ? widget.skillSet[i].level * 1.5 : 10,
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // height: 200,
      width: w * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF010000),
        boxShadow: const [
          BoxShadow(
            color: Color(0x7D010000),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(15, 15),
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
        height: _isExpanded ? 250 : 0,
        width: _isExpanded ? 250 : 0,
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
