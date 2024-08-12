import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/utils/router/route_constants.dart';
import 'dart:html' as html;

class CustomDrawer extends StatelessWidget {
  final int index;
  const CustomDrawer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black,
      child: Column(
        children: [
          // Upper Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.width * 0.02),
                child: Text(
                  "VP",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.04, top: size.width * 0.02),
                child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: size.width * 0.08,
                    )),
              )
            ],
          ),

          // Lower Section
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          html.window.open(
                              "https://github.com/Termux-Dark-Dev", 'new tab');
                        },
                        child: const Icon(
                          EvaIcons.github,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          html.window.open(
                              "https://www.linkedin.com/in/vishal-pandey-b86965228",
                              'new tab');
                        },
                        child: const Icon(
                          EvaIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: const Icon(
                        EvaIcons.email,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    )
                  ],
                ),
                Expanded(
                    child: LowerSectionMainArea(
                  index: index,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LowerSectionMainArea extends StatefulWidget {
  final int index;
  const LowerSectionMainArea({super.key, required this.index});

  @override
  State<LowerSectionMainArea> createState() => _LowerSectionMainAreaState();
}

class _LowerSectionMainAreaState extends State<LowerSectionMainArea> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: widget.index == 1 ? 1 : 0,
                child: Text(
                  "01",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: widget.index == 1
                              ? size.width * 0.15
                              : size.width * 0.1,
                          color: Colors.white24)),
                ),
              ),
              Opacity(
                opacity: widget.index == 2 ? 1 : 0,
                child: Text(
                  "02",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: widget.index == 2
                              ? size.width * 0.15
                              : size.width * 0.1,
                          color: Colors.white24)),
                ),
              ),
              Opacity(
                opacity: widget.index == 3 ? 1 : 0,
                child: Text(
                  "03",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: widget.index == 3
                              ? size.width * 0.15
                              : size.width * 0.1,
                          color: Colors.white24)),
                ),
              ),
              Opacity(
                opacity: widget.index == 4 ? 1 : 0,
                child: Text(
                  "04",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: widget.index == 4
                              ? size.width * 0.15
                              : size.width * 0.1,
                          color: Colors.white24)),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.goNamed(RouteConstants.home);
                },
                child: Text(
                  "home",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: size.width * 0.08,
                          color: widget.index == 1
                              ? Colors.white
                              : Colors.grey.shade700)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(RouteConstants.about);
                },
                child: Text(
                  "about",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: size.width * 0.08,
                          color: widget.index == 2
                              ? Colors.white
                              : Colors.grey.shade700)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(RouteConstants.projects);
                },
                child: Text(
                  "projects",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: size.width * 0.08,
                          color: widget.index == 3
                              ? Colors.white
                              : Colors.grey.shade700)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(RouteConstants.contact);
                },
                child: Text(
                  "contact",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontSize: size.width * 0.08,
                          color: widget.index == 4
                              ? Colors.white
                              : Colors.grey.shade700)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
