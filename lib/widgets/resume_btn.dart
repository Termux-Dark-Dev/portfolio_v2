import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliov2/utils/fonts.dart';

class ResumeBtn extends StatefulWidget {
  final String text;
  const ResumeBtn({super.key, required this.text});

  @override
  State<ResumeBtn> createState() => _ResumeBtnState();
}

class _ResumeBtnState extends State<ResumeBtn> {
  double _width = 0;
  Color textCol = Colors.black;

  Size _getTextSize() {
    TextSpan textSpan = TextSpan(
        text: widget.text,
        style: GoogleFonts.getFont(FontNames.primaryFont,
            textStyle: TextStyle(fontSize: 12, color: textCol)));

    TextPainter textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    Size size = _getTextSize();
    return MouseRegion(
      onExit: (event) {
        setState(() {
          _width = 0;
          textCol = Colors.black;
        });
      },
      onHover: (event) {
        setState(() {
          _width = size.width + 30;
          textCol = Colors.white;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(4)),
        height: size.height + 20,
        width: size.width + 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: _width,
                  height: size.height + 20,
                  color: Colors.black,
                )),
            Text(
              widget.text,
              style: TextStyle(
                color: textCol,
              ),
            )
          ],
        ),
      ),
    );
  }
}
