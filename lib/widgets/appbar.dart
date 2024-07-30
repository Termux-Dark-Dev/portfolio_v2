import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliov2/utils/colors.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/utils/router/route_constants.dart';
import 'package:portfoliov2/widgets/resume_btn.dart';
import 'package:portfoliov2/widgets/show_animated_text.dart';
import 'package:portfoliov2/widgets/underline_animated_text.dart';

class TAppBar extends PreferredSize {
  final String screenName;
  const TAppBar(
      {super.key,
      required super.preferredSize,
      required super.child,
      required this.screenName});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: ColorPallete.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: preferredSize.width*0.03),
                child: Text(
                  "VP",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: const TextStyle(
                          fontSize: 70, fontWeight: FontWeight.bold)),
                ),
              ),
              preferredSize.width > 700
                  ? Container(
                      // color: Colors.amber,
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: generateChildren(context)),
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }

  List<Widget> generateChildren(BuildContext context) {
    return <Widget>[
      screenName == "Home"
          ? GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.home);
              },
              child: ShowAnimatedText(
                underline: true,
                child: generateText("Home"),
              ))
          : GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.home);
              },
              child: UnderlineAnimatedText(child: generateText("Home"))),
      screenName == "About"
          ? GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.about);
              },
              child: ShowAnimatedText(
                  underline: true, child: generateText("About")))
          : GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.about);
              },
              child: UnderlineAnimatedText(child: generateText("About"))),
      screenName == "Contact"
          ? GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.contact);
              },
              child: ShowAnimatedText(
                  underline: true, child: generateText("Contact")))
          : GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.contact);
              },
              child: UnderlineAnimatedText(child: generateText("Contact"))),
      screenName == "Projects"
          ? GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.projects);
              },
              child: ShowAnimatedText(
                  underline: true, child: generateText("Projects")))
          : GestureDetector(
              onTap: () {
                context.goNamed(RouteConstants.projects);
              },
              child: UnderlineAnimatedText(child: generateText("Projects"))),
      const SizedBox(
        width: 3,
      ),
      const ResumeBtn(
        text: " Resume ",
      )
    ];
  }

  Text generateText(String data) {
    return Text(
      data,
      style: GoogleFonts.getFont(FontNames.primaryFont,
          textStyle: const TextStyle(fontSize: 22)),
    );
  }
}
