import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/utils/router/route_constants.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn({super.key});

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  double _width = 30;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Size _getTextSize() {
    TextSpan textSpan = TextSpan(
        text: "See My Projects",
        style: GoogleFonts.getFont(FontNames.primaryFont,
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black)));
    TextPainter textPainter = TextPainter(
        text: textSpan, textDirection: TextDirection.ltr, maxLines: 1);
    textPainter.layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    Size size = _getTextSize();
    return SizedBox(
      height: size.height + 20,
      width: size.width + 50,
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _width = 200;
          });
        },
        onExit: (event) {
          setState(() {
            _width = 30;
          });
        },
        child: GestureDetector(
          onTap: () {
            context.goNamed(RouteConstants.projects);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: _width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40))),
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    " See My Projects",
                    style: GoogleFonts.getFont(FontNames.primaryFont,
                        textStyle:  TextStyle(
                            fontSize: size.width*0.14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
