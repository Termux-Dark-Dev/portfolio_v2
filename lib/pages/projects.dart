import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/widgets/appbar.dart';
import 'package:portfoliov2/widgets/customchip.dart';
import 'package:portfoliov2/widgets/live_widget.dart';
import 'package:portfoliov2/widgets/show_animated_text.dart';
import 'dart:math' as math;

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18)),
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
              techStack: [
                ["Flutter", Brands.flutter],
                ["Nodejs", Brands.nodejs],
                ["Express", Brands.express_js],
                ["Postgresql", Brands.postgresql]
              ],
              desc:
                  "I developed an app that integrates with Spotify to enhance social connectivity through music. It fetches users’ top artists and playlists, compares music tastes using data science, and displays a compatibility percentage. The app also includes a messaging feature built with Node.js WebSocket. This project showcases my skills in Flutter, Node.js, and PostgreSQL, and my commitment to creating user-centric digital solutions. The source code is publicly available."),
          buildProjectContainer(context,
              isLive: false,
              assetimage: "projects/looks/logo.jpg",
              projectName: "Looks",
              techStack: [
                ["Flutter", Brands.flutter],
                ["Nodejs", Brands.nodejs],
                ["Express", Brands.express_js],
                ["Mysql", Brands.mysql_logo],
                ["Nginx", Brands.nginx]
              ],
              desc:
                  "Looks is a digital platform for booking salon appointments. It allows salons to register and become visible to users within a 5-10 km radius. Users can browse local salons, select services, and book appointments through the app. This project highlights the potential of digital solutions in enhancing local business visibility and accessibility in the beauty industry.\n"),
          buildProjectContainer(context,
              isLive: false,
              assetimage: "projects/contacta/logo.png",
              projectName: "Contacta",
              techStack: [
                ["Flutter", Brands.flutter],
                ["Firebase", Brands.firebase],
              ],
              desc:
                  "hello this is short desc about the app please rate the desc and the app on the github and playstore please plaese how u doing"),
          buildProjectContainer(context,
              isLive: true,
              assetimage: "projects/examtoday/logo.png",
              projectName: "Exam Today",
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
              techStack: [
                ["Code Igniter", Brands.php_designer],
                ["Mysql", Brands.mysql_logo],
                ["Bootstrap", Brands.bootstrap_2],
              ],
              desc:
                  "I created a dynamic website hosting an interactive quiz system as a paid project. It offers a user-friendly platform for testing knowledge across various subjects, emphasizing a seamless user experience. Due to the project agreement, the codebase is not publicly shared. This project highlights the potential of digital platforms in education and continuous learning."),
          buildProjectContainer(context,
              assetimage: "projects/onss/logo.png",
              projectName: "Online Note Sharing System",
              isLive: false,
              techStack: [
                ["Code Igniter", Brands.php_designer],
                ["Mysql", Brands.mysql_logo],
                ["Bootstrap", Brands.bootstrap_2],
              ],
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
      required bool isLive}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: size.width * 0.4),
      clipBehavior: Clip.antiAlias,
      // height: 300,
      decoration: BoxDecoration(
          // color: Colors.blueAccent,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          // logo and tech stack
          Row(
            children: [
              Expanded(
                  child: Image.asset(
                assetimage,
                height: size.height * 0.25,
                fit: BoxFit.cover,
                scale: 0.5,
              )),
              Expanded(
                  child: Container(
                      constraints:
                          BoxConstraints(maxHeight: size.height * 0.25),
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
                              style: GoogleFonts.getFont(FontNames.primaryFont,
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
                      )))
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        projectName,
                        style: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w600)),
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
                      onPressed: () {},
                      child: Text(
                        "View Images",
                        style: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: const TextStyle(color: Colors.white)),
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
                  children: [Brand(Brands.github)],
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
