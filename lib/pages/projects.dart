import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/widgets/appbar.dart';
import 'package:portfoliov2/widgets/customchip.dart';
import 'package:portfoliov2/widgets/drawer.dart';
import 'package:portfoliov2/widgets/live_widget.dart';
import 'package:portfoliov2/widgets/show_animated_text.dart';
import 'dart:math' as math;
import 'dart:html' as html;
import 'package:portfoliov2/widgets/show_proj_images.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: size.width < 700
          ? const CustomDrawer(
              index: 3,
            )
          : null,
      appBar: TAppBar(
          preferredSize: Size(size.width, 100),
          screenName: "Projects",
          child: const SizedBox()),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
              angle: -(math.pi / 2),
              child: ShowAnimatedText(
                underline: false,
                child: Text(
                  "projects",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.02)),
                ),
              )),
          Expanded(
            child: Container(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [ProjectScreen()],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      constraints:
          BoxConstraints(minHeight: size.height - 100, minWidth: size.width),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: 40,
        children: [
          buildProjectContainer(context,
              isLive: false,
              assetimage: "projects/musicalchat/logo.png",
              projectName: "Musical Chat",
              imageList: [
                "assets/projects/musicalchat/home.png",
                "assets/projects/musicalchat/image.png",
                "assets/projects/musicalchat/image1.png",
                "assets/projects/musicalchat/image2.png",
                "assets/projects/musicalchat/image3.png",
                "assets/projects/musicalchat/image5.png",
                "assets/projects/musicalchat/profile.png",
              ],
              techStack: [
                ["Flutter", Brands.flutter],
                ["Nodejs", Brands.nodejs],
                ["Express", Brands.express_js],
                ["Postgresql", Brands.postgresql]
              ],
              githubUrl: "https://github.com/Termux-Dark-Dev/musicalchat",
              liveUrl: "",
              desc:
                  "I developed an app that integrates with Spotify to enhance social connectivity through music. It fetches users’ top artists and playlists, compares music tastes using data science, and displays a compatibility percentage. The app also includes a messaging feature built with Node.js WebSocket. This project showcases my skills in Flutter, Node.js, and PostgreSQL, and my commitment to creating user-centric digital solutions. The source code is publicly available."),
          buildProjectContainer(context,
              isLive: false,
              assetimage: "projects/looks/logo.jpg",
              projectName: "Looks",
              imageList: [
                "assets/projects/looks/book.jpg",
                "assets/projects/looks/booking.jpg",
                "assets/projects/looks/error.jpg",
                "assets/projects/looks/homepage.jpg",
                "assets/projects/looks/notavail.jpg",
                "assets/projects/looks/otp.jpg",
                "assets/projects/looks/timeset.jpg",
              ],
              techStack: [
                ["Flutter", Brands.flutter],
                ["Nodejs", Brands.nodejs],
                ["Express", Brands.express_js],
                ["Mysql", Brands.mysql_logo],
                ["Nginx", Brands.nginx]
              ],
              githubUrl: "https://github.com/Termux-Dark-Dev/phileclient",
              liveUrl: "",
              desc:
                  "Looks is a digital platform for booking salon appointments. It allows salons to register and become visible to users within a 5-10 km radius. Users can browse local salons, select services, and book appointments through the app. This project highlights the potential of digital solutions in enhancing local business visibility and accessibility in the beauty industry.\n"),
          buildProjectContainer(context,
              isLive: false,
              assetimage: "projects/contacta/logo.png",
              projectName: "Contacta",
              imageList: [
                "assets/projects/contacta/addcontact.jpg",
                "assets/projects/contacta/group.jpg",
                "assets/projects/contacta/groupadd.jpg",
                "assets/projects/contacta/home.jpg",
                "assets/projects/contacta/login.jpg",
                "assets/projects/contacta/splashscreen.jpg",
              ],
              techStack: [
                ["Flutter", Brands.flutter],
                ["Firebase", Brands.firebase],
              ],
              githubUrl: "",
              liveUrl: "",
              desc:
                  "hello this is short desc about the app please rate the desc and the app on the github and playstore please plaese how u doing"),
          buildProjectContainer(context,
              isLive: true,
              assetimage: "projects/examtoday/logo.png",
              projectName: "Exam Today",
              imageList: [
                "assets/projects/examtoday/drawer.jpg",
                "assets/projects/examtoday/home.jpg",
                "assets/projects/examtoday/login.jpg",
                "assets/projects/examtoday/profile.jpg",
                "assets/projects/examtoday/result.jpg",
              ],
              githubUrl: "",
              liveUrl: "https://play.google.com/store/apps/details?id=com.techplusnics.examtoday",
              techStack: [
                ["Flutter", Brands.flutter],
                ["Firebase", Brands.firebase],
              ],
              desc:
                  "I developed Exam Today, a mobile app for creating and participating in quizzes. The app, which has around 1.4k downloads, demonstrates the potential of digital platforms in education. Due to the project agreement, the codebase is not publicly shared. This project showcases my ability to deliver tailored software solutions that meet client and user expectations."),
          buildProjectContainer(context,
              isLive: true,
              assetimage: "projects/ins-tech/logo.jpg",
              projectName: "Ins-Tech",
              imageList: [
                "assets/projects/ins-tech/image.png",
                "assets/projects/ins-tech/image1.png",
                "assets/projects/ins-tech/image2.png",
              ],
              techStack: [
                ["Code Igniter", Brands.php_designer],
                ["Mysql", Brands.mysql_logo],
                ["Bootstrap", Brands.bootstrap_2],
              ],
              githubUrl: "",
              liveUrl: "https://ins-tech.in/",
              desc:
                  "I created a dynamic website hosting an interactive quiz system as a paid project. It offers a user-friendly platform for testing knowledge across various subjects, emphasizing a seamless user experience. Due to the project agreement, the codebase is not publicly shared. This project highlights the potential of digital platforms in education and continuous learning."),
          buildProjectContainer(context,
              assetimage: "projects/onss/logo.png",
              projectName: "Online Note Sharing System",
              imageList: [
                "assets/projects/onss/dash.png",
                "assets/projects/onss/addnote.png",
                "assets/projects/onss/image.png",
                "assets/projects/onss/image1.png",
                "assets/projects/onss/login.png",
                "assets/projects/onss/pay.png"
              ],
              isLive: false,
              techStack: [
                ["Code Igniter", Brands.php_designer],
                ["Mysql", Brands.mysql_logo],
                ["Bootstrap", Brands.bootstrap_2],
              ],
              githubUrl: "https://github.com/Termux-Dark-Dev/onss",
              liveUrl: "",
              desc:
                  "ONSS is a platform for sharing and accessing notes. Users can download free or paid notes without registration, while contributors can upload notes after signing up. The platform includes a secure payment method for paid notes. ONSS exemplifies the power of digital platforms in fostering collaborative learning environments."),
        ],
      ),
    );
  }

  Widget buildProjectContainer(BuildContext context,
      {required String assetimage,
      required List<List<String>> techStack,
      required String desc,
      required String projectName,
      required List<String> imageList,
      required String githubUrl,
      required String liveUrl,
      required bool isLive}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
          maxWidth: size.width <= 700 ? size.width : size.width * 0.8),
      clipBehavior: Clip.antiAlias,
      // height: 300,
      decoration: BoxDecoration(
          // color: Colors.blueAccent,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          // logo and tech stack
          size.width > 700
              ? Row(
                  children: [
                    Image.asset(
                      assetimage,
                      height: size.width > 700
                          ? size.height * 0.3
                          : size.height * 0.25,
                      fit: BoxFit.contain,
                      scale: 1,
                    ),
                    Expanded(
                        child: Container(
                            constraints: BoxConstraints(
                                maxHeight: size.width > 700
                                    ? size.height * 0.3
                                    : size.height * 0.25),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.black))),
                            // padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Tech Stack",
                                    style: GoogleFonts.getFont(
                                        FontNames.primaryFont,
                                        textStyle: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Wrap(
                                      runSpacing: 8,
                                      spacing: 8,
                                      children: buildTechStack(techStack)),
                                ),
                              ],
                            )))
                  ],
                )
              : Column(
                  children: [
                    Image.asset(
                      assetimage,
                      height: size.height * 0.25,
                      fit: BoxFit.cover,
                      scale: 0.5,
                    ),
                    Container(
                        // constraints:
                        //     BoxConstraints(maxHeight: size.height * 0.25),
                        decoration: const BoxDecoration(
                            border:
                                Border(left: BorderSide(color: Colors.black))),
                        // padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.black,
                              width: size.width,
                              alignment: Alignment.center,
                              child: Text(
                                "Tech Stack",
                                style: GoogleFonts.getFont(
                                    FontNames.primaryFont,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Wrap(
                                  runSpacing: 8,
                                  spacing: 8,
                                  children: buildTechStack(techStack)),
                            ),
                          ],
                        ))
                  ],
                ),
          // live and view btns
          Container(
              // margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(10),
                //     bottomRight: Radius.circular(10)),
                border: Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black)),
              ),
              child: size.width > 700
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          projectName,
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        // const SizedBox(
                        //   width: 8,
                        // ),
                        LiveWidget(
                          isLive: isLive,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                overlayColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.black54),
                            onPressed: () {
                              ShowProjImagesWidget.showProjectImages(
                                  context, imageList);
                            },
                            child: Text(
                              "View Images",
                              style: GoogleFonts.getFont(FontNames.primaryFont,
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                            ))
                      ],
                    )
                  : Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 10,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              projectName,
                              style: GoogleFonts.getFont(FontNames.primaryFont,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            LiveWidget(
                              isLive: isLive,
                            )
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                overlayColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.black54),
                            onPressed: () {
                              ShowProjImagesWidget.showProjectImages(
                                  context, imageList);
                            },
                            child: Text(
                              "View Images",
                              style: GoogleFonts.getFont(FontNames.primaryFont,
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                            ))
                      ],
                    )),
          // short desc and github redirect
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: RichText(
                    text: TextSpan(
                        text: "Short Description : ",
                        style: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w700)),
                        children: [
                          TextSpan(
                              style: GoogleFonts.getFont(FontNames.primaryFont,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300)),
                              text: "\n$desc")
                        ]),
                  ),
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isLive
                        ? GestureDetector(
                            onTap: () {
                              html.window.open(liveUrl, 'new tab');
                            },
                            child: const Icon(Icons.send_rounded))
                        : GestureDetector(
                            onTap: () {
                              html.window.open(githubUrl, 'new tab');
                            },
                            child: Brand(Brands.github)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildTechStack(List<List<String>> techStack) {
    List<Widget> list = [];
    for (List<String> item in techStack) {
      list.add(CustomChip(name: item[0], brandName: item[1]));
    }
    return list;
  }
}
