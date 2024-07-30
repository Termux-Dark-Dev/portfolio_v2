import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfoliov2/utils/colors.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/utils/helpers/sizehelper.dart';
import 'package:portfoliov2/widgets/appbar.dart';
import 'package:portfoliov2/widgets/custom_btn.dart';
import 'package:portfoliov2/widgets/show_animated_text.dart';
import 'package:portfoliov2/widgets/underline_animated_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = SizeHelper.getSize(context);
    return Scaffold(
      drawer: size.width < 700 ? const Drawer() : null,
      appBar: TAppBar(
        preferredSize: Size(size.width, 100),
        screenName: "Home",
        child: const SizedBox(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const HomePageBg(),
          size.width > 700 ? const HomePageFg() : const HomePageFgMobile()
        ],
      ),
    );
  }
}

class HomePageBg extends StatelessWidget {
  const HomePageBg({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = SizeHelper.getSize(context);
    return Container(
      height: size.height - 100,
      width: size.width,
      color: ColorPallete.primaryColor,
      alignment: Alignment.center,
      child: Container(
        height: size.height * 0.8,
        width: size.height * 0.8,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HomePageFg extends StatelessWidget {
  const HomePageFg({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = SizeHelper.getSize(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          // Desktop Page Left Side
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "Hi,",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.038,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "I'm Vishal.",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.038,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "Software Engineer.",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.038,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                FadeInUp(
                    from: 40,
                    delay: const Duration(milliseconds: 900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UnderlineAnimatedText(
                            child: Text("Mobile Engineer",
                                style: GoogleFonts.getFont(
                                    FontNames.primaryFont,
                                    textStyle: TextStyle(
                                        fontSize: size.width * 0.016,
                                        color: Colors.grey)))),
                        Text(" / ",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize: size.width * 0.014,
                                    color: Colors.grey))),
                        UnderlineAnimatedText(
                            child: Text("Full Stack Developer",
                                style: GoogleFonts.getFont(
                                    FontNames.primaryFont,
                                    textStyle: TextStyle(
                                        fontSize: size.width * 0.016,
                                        color: Colors.grey))))
                      ],
                    )),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const CustomBtn(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "Github",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.018,
                                  color: Colors.grey)),
                        )),
                    Text(
                      "/  ",
                      style: TextStyle(
                          fontSize: size.width * 0.018,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "LinkedIn",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.018,
                                  color: Colors.grey)),
                        )),
                    Text(
                      "/  ",
                      style: TextStyle(
                          fontSize: size.width * 0.018,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "Twitter",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.018,
                                  color: Colors.grey)),
                        ))
                  ],
                )
              ],
            ),
          )),

          // Desktop Page Right Side
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(bottom: 150, right: 50),
            child: LottieBuilder.asset(
              "assets/lottie/hello.json",
              height: size.height * 0.4,
              width: size.width * 0.4,
            ),
          ))
        ],
      ),
    );
  }
}

class HomePageFgMobile extends StatelessWidget {
  const HomePageFgMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = SizeHelper.getSize(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: LottieBuilder.asset(
              "assets/lottie/hello.json",
              height: size.height * 0.2,
              width: size.width * 0.2,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: size.width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "Hi,",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.07,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "I'm Vishal.",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.07,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                ShowAnimatedText(
                  underline: false,
                  child: Text(
                    "Software Engineer.",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle: TextStyle(
                            fontSize: size.width * 0.07,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                FadeInUp(
                    from: 40,
                    delay: const Duration(milliseconds: 900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UnderlineAnimatedText(
                            child: Text("Mobile Engineer",
                                style: GoogleFonts.getFont(
                                    FontNames.primaryFont,
                                    textStyle: TextStyle(
                                        fontSize: size.width * 0.03,
                                        color: Colors.grey)))),
                        Text(" / ",
                            style: GoogleFonts.getFont(FontNames.primaryFont,
                                textStyle: TextStyle(
                                    fontSize: size.width * 0.03,
                                    color: Colors.grey))),
                        UnderlineAnimatedText(
                            child: Text("Full Stack Developer",
                                style: GoogleFonts.getFont(
                                    FontNames.primaryFont,
                                    textStyle: TextStyle(
                                        fontSize: size.width * 0.03,
                                        color: Colors.grey))))
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                // const CustomBtn(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Text(
                      "See my projects",
                      style: GoogleFonts.getFont(FontNames.primaryFont,
                          color: Colors.black),
                    )),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "Github",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.038,
                                  color: Colors.grey)),
                        )),
                    Text(
                      "/  ",
                      style: TextStyle(
                          fontSize: size.width * 0.038,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "LinkedIn",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.038,
                                  color: Colors.grey)),
                        )),
                    Text(
                      "/  ",
                      style: TextStyle(
                          fontSize: size.width * 0.038,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    ShowAnimatedText(
                        underline: true,
                        child: Text(
                          "Twitter",
                          style: GoogleFonts.getFont(FontNames.primaryFont,
                              textStyle: TextStyle(
                                  fontSize: size.width * 0.038,
                                  color: Colors.grey)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
