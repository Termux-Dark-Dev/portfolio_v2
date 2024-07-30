import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliov2/utils/fonts.dart';

class LiveWidget extends StatefulWidget {
  final bool isLive;
  const LiveWidget({super.key, required this.isLive});

  @override
  State<LiveWidget> createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _tween = Tween<double>(begin: 0, end: 1).animate(_animationController);
    if (mounted && _animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    }
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FadeTransition(
          opacity: _tween,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isLive ? Colors.green : Colors.red),
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          widget.isLive ? "Live" : "Not Live",
          style: GoogleFonts.getFont(FontNames.primaryFont,
              textStyle: const TextStyle(color: Colors.black)),
        )
      ],
    );
  }
}
