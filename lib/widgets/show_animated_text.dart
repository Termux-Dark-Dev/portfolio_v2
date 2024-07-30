import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfoliov2/widgets/underline_animated_text.dart';

class ShowAnimatedText extends StatefulWidget {
  final Text child;
  final bool underline;
  const ShowAnimatedText(
      {super.key, required this.child, required this.underline});

  @override
  State<ShowAnimatedText> createState() => _ShowAnimatedTextState();
}

class _ShowAnimatedTextState extends State<ShowAnimatedText>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _tween;
  Alignment _alignment = Alignment.centerLeft;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _tween = Tween<double>(begin: 0, end: 300).animate(_animationController);
    Timer(const Duration(milliseconds: 500), () {
      // _animationController.forward();
      if (mounted && _animationController.status != AnimationStatus.completed) {
        _animationController.forward();
      }
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _alignment = Alignment.centerRight;
          _isVisible = true;
        });
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
     _animationController.dispose();
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

    return SizedBox(
      width: textSize.width + 20,
      height: textSize.height + 5,
      child: Stack(
        children: [
          Visibility(
            visible: _isVisible,
            child: widget.underline
                ? UnderlineAnimatedText(child: widget.child)
                : widget.child,
          ),
          Align(
            alignment: _alignment,
            child: AnimatedBuilder(
              animation: _tween,
              builder: (context, child) {
                return Container(
                  // padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  // height: _isVisible ? null : 100,
                  width: _tween.value,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
