import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/backend/emailService.dart';
import 'package:portfolio/commons.dart';
import 'package:portfolio/backend/projectsManager.dart';
import 'package:portfolio/backend/skillsManager.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/screens/tablet/tabletProjectPage.dart';
import 'package:portfolio/widgets/drawerIcon.dart';
import 'package:portfolio/widgets/endDrawer.dart';
import 'package:portfolio/widgets/shadowButton.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TabletHomepage extends StatefulWidget {
  const TabletHomepage({super.key});

  @override
  State<TabletHomepage> createState() => _TabletHomepageState();
}

class _TabletHomepageState extends State<TabletHomepage> {
  bool _isDownloadButtonHovered = false;

  final ScrollController _scrollController = ScrollController();
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

  // late RenderBox innerSkillSection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   innerSkillSection =
    //       skillsSectionInnerKey.currentContext?.findRenderObject() as RenderBox;
    // });
  }

  final GlobalKey skillsSectionInnerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: MyEndDrawer(
        fontSize: 13,
        width: w * 0.45,
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
                          Txt(
                            'Hi, I\'m',
                            weight: FontWeight.bold,
                            size: 13,
                          ),
                          CustomAnimatedText(
                            'Ritesh Kumar',
                            size: w * 0.05,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          // about
                          CustomAnimatedText(
                            'Flutter Developer,',
                            size: w * 0.035,
                            spacing: 2,
                            weight: FontWeight.bold,
                          ),
                          CustomAnimatedText(
                            'AI & ML Enthusiast',
                            size: w * 0.035,
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
                            width: 150,
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
                                    Txt('SEE MY WORK ', size: 13, spacing: 2),
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
                                child: Txt(' GitHub ',
                                    spacing: 1,
                                    size: (14 < w * 0.025) ? 14 : w * 0.025),
                              ),
                              Txt(' / '),
                              InkWell(
                                onTap: () {
                                  RouterClass().launchURL(
                                      'https://www.linkedin.com/in/ritesh-kumar-482824239/');
                                },
                                child: Txt(' LinkedIn ',
                                    spacing: 1,
                                    size: (14 < w * 0.025) ? 14 : w * 0.025),
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
            Container(
              key: projectsSectionKey,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              // crafted with love msg
              // project tile

              // child: StreamBuilder(
              //   stream: ProjectsManager().getProjectsFromFirebase(),
              //   builder: (context, snapshot) {
              //     List<ProjectModel> projectSet = [];
              //     if (snapshot.hasData) {
              //       for (var data in snapshot.data.docs) {
              //         data = data.data() as Map<String, dynamic>;
              //         ProjectModel projectItem = ProjectModel(
              //           name: data['projectName'],
              //           desc: data['projectDesc'],
              //           githubLink: data['githubLink'],
              //           availablePlatforms: data['availablePlatforms'],
              //           toolsUsed: data['toolsUsed'],
              //           tags: data['tags'],
              //           projectIconURL: data['projectIconURL'],
              //           features: data['features'],
              //         );
              //         // print('---->> ${projectItem.name}');
              //         projectSet.add(projectItem);
              //       }
              //     }
              //     // return ProjectTileWidget();
              //     return Column(
              //       children: [
              //         const SizedBox(height: 20),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Txt(
              //               'Crafted with Love',
              //               size: w * 0.05,
              //               spacing: 3,
              //               weight: FontWeight.bold,
              //               fontStyle: FontStyle.italic,
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 20),
              //         for (int i = 0; i < projectSet.length; i++)
              //           ProjectTileWidget(index: i, projectSet: projectSet),
              //         const SizedBox(height: 20),
              //         // All projects link
              //         InkWell(
              //           onTap: () {
              //             RouterClass().launchURL(
              //                 'https://github.com/LazyShinigami?tab=repositories');
              //           },
              //           child: Txt(
              //             '  Click here to view all my projects on GitHub >  ',
              //             spacing: 2.5,
              //             wordSpacing: 5,
              //             size: (w * 0.02 > 12) ? 12 : w * 0.02,
              //             fontStyle: FontStyle.italic,
              //           ),
              //         ),
              //         const SizedBox(height: 20),
              //       ],
              //     );
              //   },
              // ),
            ),

            // Skills Section
            const SizedBox(height: 20),
            Padding(
              key: skillsSectionKey,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    'Skills in My Backpack',
                    size: w * 0.05,
                    spacing: 3,
                    weight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              // child: StreamBuilder(
              //   stream: SkillsManager().getSkillsFromFirebase(),
              //   builder: (context, snapshot) {
              //     List<SkillModel> skillSet = [];
              //     if (snapshot.hasData) {
              //       for (var data in snapshot.data.docs) {
              //         data = data.data() as Map<String, dynamic>;
              //         SkillModel skillItem = SkillModel(
              //           name: data['skillName'],
              //           level: data['skillLevel'],
              //           category: data['skillCategory'],
              //         );
              //         // print('---->> ${skillItem.name}');
              //         skillSet.add(skillItem);
              //       }
              //     }
              //     // RenderBox innerSkillSection =
              //     //     skillsSectionInnerKey.currentContext?.findRenderObject()
              //     // as RenderBox;
              //     // Size innerSkillSectionSize = ;
              //     return Stack(
              //       children: [
              //         Positioned(
              //           top: 0,
              //           bottom: 0,
              //           left: 0,
              //           right: 0,
              //           child: Center(
              //             child: Icon(
              //               Icons.settings_suggest_rounded,
              //               size: (w * 0.25 < 200) ? w * 0.25 : 200,
              //               color: const Color(0x559E9E9E),
              //             ),
              //           ),
              //         ),
              //         Row(
              //           key: skillsSectionInnerKey,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             // Column I - Languages, Core Concepts, Version Control
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 SkillSectionByType(
              //                     category: 'Languages', skillSet: skillSet),
              //                 const SizedBox(height: 20),
              //                 SkillSectionByType(
              //                     category: 'Core Concepts',
              //                     skillSet: skillSet),
              //                 const SizedBox(height: 20),
              //                 SkillSectionByType(
              //                     category: 'Ongoing...', skillSet: skillSet),
              //               ],
              //             ),

              //             // Column II - Front-end, Back-end, Ongoing
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 SkillSectionByType(
              //                     category: 'Front-End', skillSet: skillSet),
              //                 const SizedBox(height: 20),
              //                 SkillSectionByType(
              //                     category: 'Back-End', skillSet: skillSet),
              //                 const SizedBox(height: 20),
              //                 SkillSectionByType(
              //                     category: 'Version Control',
              //                     skillSet: skillSet),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     );
              //   },
              // ),
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
            padding: EdgeInsets.symmetric(
                vertical: 50, horizontal: (w * 0.2 > 20) ? w * 0.2 : 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Txt(
                        'Want to get in touch? Send an e-mail!',
                        size: w * 0.035,
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
                  '   The design for this website was inspired by Ye Lwin Wo\'s portfolio website',
                  color: const Color(0x709E9E9E),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      child: Image.network(
                        projectSet[index].projectIconURL,
                        fit: BoxFit.cover,
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
                      size: w * 0.035,
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
                    size: w * 0.03,
                    spacing: 2,
                    weight: FontWeight.bold,
                  ),

                  // desc
                  // Txt(
                  //   projectSet[index].desc,
                  //   maxLines: 2,
                  //   spacing: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   size: 15.78,
                  //   align: TextAlign.right,
                  // ),

                  // view project button
                  const SizedBox(height: 7.8),
                  ShadowButton(
                    width: 125,
                    offset: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          RouterClass().createRoute(
                            nextScreen: TabletProjectPage(
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
                            Txt('View Project ',
                                size: (w * 0.02 > 14) ? 14 : w * 0.02,
                                spacing: 2),
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
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          widget.category,
          weight: FontWeight.bold,
          spacing: 1,
          size: (17 < w * 0.03) ? 17 : w * 0.03,
        ),
        const SizedBox(height: 5),
        for (int i = 0; i < widget.skillSet.length; i++)
          if (widget.skillSet[i].category == widget.category)
            Row(
              children: [
                SizedBox(
                  width: 82.5,
                  child: Txt(widget.skillSet[i].name,
                      size: (14 < w * 0.028) ? 14 : w * 0.028, spacing: 2),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 3,
                      child: Center(
                        child: Container(
                          height: 1,
                          width: 100,
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
                        width: _isExpanded ? widget.skillSet[i].level * 1 : 10,
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
      height: 200,
      width: w * 0.35,
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
