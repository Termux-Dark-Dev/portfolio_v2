import 'package:flutter/material.dart';

class UnderlineAnimatedText extends StatefulWidget {
  final Text child;
  const UnderlineAnimatedText({super.key, required this.child});

  @override
  State<UnderlineAnimatedText> createState() => _UnderlineAnimatedTextState();
}

class _UnderlineAnimatedTextState extends State<UnderlineAnimatedText> {
  late double width;
  Alignment _alignment = Alignment.centerLeft;
  @override
  void initState() {
    super.initState();
    width = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Size _getTextSize(BuildContext context, Text text) {
    final TextSpan textSpan = TextSpan(
      text: text.data,
      style: text.style,
    );
    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    Size textSize = _getTextSize(context, widget.child);

    return MouseRegion(
      onHover: (event) {
        setState(() {
          _alignment = Alignment.bottomLeft;
          width = textSize.width+20;
        });
      },
      onExit: (event) {
        setState(() {
          _alignment = Alignment.bottomRight;
          width = 0;
        });
      },
      child: SizedBox(
        width: textSize.width+20,
        height: textSize.height+5,
        // color: Colors.amber,
        // padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Align(
              alignment: _alignment,
              child: AnimatedContainer(
                  color: Colors.black,
                  width: width,
                  height: 3,
                  duration: const Duration(milliseconds: 100)),
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
