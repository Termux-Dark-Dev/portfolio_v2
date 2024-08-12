import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/widgets/appbar.dart';
import 'package:portfoliov2/widgets/customchip.dart';
import 'package:portfoliov2/widgets/drawer.dart';
import 'dart:math' as math;

import 'package:portfoliov2/widgets/show_animated_text.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: size.width < 700 ? const CustomDrawer(index: 2,) : null,
        appBar: TAppBar(
          preferredSize: Size(size.width, 100),
          screenName: "About",
          child: const SizedBox(),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: -(math.pi / 2),
                child: ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "about",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * 0.02)),
                  ),
                )),
            Expanded(
                child: Container(
              // color: Colors.amber,
              child: ListView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  const UpperInfoWidget(),
                  LowerInfoWidget(
                    scrollController: scrollController,
                  )
                ],
              ),
            ))
          ],
        ));
  }
}

class UpperInfoWidget extends StatelessWidget {
  const UpperInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Container(
            padding: const EdgeInsets.all(15),
            width: constraints.maxWidth,
            // color: Colors.blue,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            "I specialize in",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.055)),
                          )),
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            "building high quality",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.055)),
                          )),
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            "mobile and backend applications.",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.055)),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: constraints.maxWidth * 0.6,
                    width: constraints.maxWidth * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //     image: AssetImage("assets/images/pic.jpg")),
                        borderRadius: BorderRadius.circular(18)),
                  ),
                )
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(15),
          width: constraints.maxWidth,
          // color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ShowAnimatedText(
                        underline: false,
                        child: Text(
                          "I specialize in",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: constraints.maxWidth * 0.025)),
                        )),
                    ShowAnimatedText(
                        underline: false,
                        child: Text(
                          "building high quality",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: constraints.maxWidth * 0.025)),
                        )),
                    ShowAnimatedText(
                        underline: false,
                        child: Text(
                          "mobile and backend applications.",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: constraints.maxWidth * 0.025)),
                        ))
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Container(
                  height: constraints.maxWidth * 0.28,
                  width: constraints.maxWidth * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      // image: const DecorationImage(
                      //   fit: BoxFit.cover,
                      //     image: AssetImage("assets/images/pic.jpg")),
                      borderRadius: BorderRadius.circular(18)),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}

class LowerInfoWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LowerInfoWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.only(
              right: constraints.maxWidth -
                  ((constraints.maxWidth * 0.5) +
                      ((constraints.maxWidth * 0.5) / 2) +
                      ((constraints.maxWidth * 0.35) / 2))),
          child: Container(
            child: Column(
              children: [
                _buildInfoSection(
                    context: context,
                    padding: 50,
                    title: "A little bit about myself.",
                    desc:
                        "I am a full stack engineer with great passion for building high quality mobile applications. I have an extensive experience building mobile applications.\n\nI have Bachelor's in CS from Mumbai University. I have strong technical skills as well as excellent interpersonal skills using which i have created some paid clients projects too. I enjoy building fun/useful projects in my free time.",
                    num: 1,
                    leftTitle: "Story"),
                _buildInfoSection(
                    context: context,
                    padding: 30,
                    title: "What I Use.",
                    desc:
                        "I use number of tools to aid my creative process when bringing things to live. Listed below are the tools and technologies that i have used over the years.",
                    num: 2,
                    leftTitle: "Technology"),
                const SizedBox(
                  height: 15,
                ),
                _MyToolsSec(context)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection(
      {required BuildContext context,
      required double padding,
      required String title,
      required String desc,
      required double num,
      required String leftTitle}) {
    Size size = MediaQuery.of(context).size;
    if (size.width > 700) {
      return Container(
        padding: EdgeInsets.only(top: padding, bottom: padding),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            "/0$num|",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: const TextStyle(fontSize: 14)),
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            "$leftTitle|",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: const TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ))
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowAnimatedText(
                          underline: false,
                          child: Text(
                            title,
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02)),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          child: Text(
                        desc,
                        style: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: TextStyle(
                                fontSize: 18, color: Colors.grey.shade600)),
                      ))
                    ],
                  ),
                ))
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(top: padding, bottom: padding),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowAnimatedText(
                    underline: false,
                    child: Text(
                      "/0$num|",
                      style: GoogleFonts.getFont(FontNames.primaryFont,
                          textStyle:  TextStyle(fontSize: size.width*0.04)),
                    )),
                const SizedBox(
                  width: 5,
                ),
                ShowAnimatedText(
                    underline: false,
                    child: Text(
                      "$leftTitle|",
                      style: GoogleFonts.getFont(FontNames.primaryFont,
                          textStyle:  TextStyle(
                              fontSize: size.width*0.04, color: Colors.grey)),
                    ))
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                ShowAnimatedText(
                    underline: false,
                    child: Text(
                      title,
                      style: GoogleFonts.getFont(FontNames.primaryFont,
                          textStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width *
                                  0.06)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                FadeInUp(
                    child: Text(
                  desc,
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: 18, color: Colors.grey.shade600)),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _MyToolsSec(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Visibility(
            visible: size.width>700?true:false,
            child: Flexible(
              flex: 1,
              child: Container(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowAnimatedText(
                    underline: false,
                    child: Text(
                      "Technologies",
                      style: GoogleFonts.getFont(FontNames.primaryFont,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SlideInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: const Wrap(
                    spacing: 30,
                    runSpacing: 15,
                    children: [
                      CustomChip(
                        name: "Flutter",
                        brandName: Brands.flutter,
                      ),
                      CustomChip(
                        name: "Git",
                        brandName: Brands.git,
                      ),
                      CustomChip(
                        name: "Firebase",
                        brandName: Brands.firebase,
                      ),
                      CustomChip(
                        name: "PHP",
                        brandName: Brands.php_designer,
                      ),
                      CustomChip(
                        name: "Dart",
                        brandName: Brands.dart,
                      ),
                      CustomChip(
                        name: "Node JS",
                        brandName: Brands.nodejs,
                      ),
                      CustomChip(
                        name: "Express",
                        brandName: Brands.express,
                      ),
                      CustomChip(
                        name: "HTML",
                        brandName: Brands.html_5,
                      ),
                      CustomChip(
                        name: "CSS",
                        brandName: Brands.css3,
                      ),
                      CustomChip(
                        name: "Javascript",
                        brandName: Brands.javascript,
                      ),
                      CustomChip(
                        name: "SQL",
                        brandName: Brands.my_sql,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
