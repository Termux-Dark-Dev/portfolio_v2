import 'package:flutter/material.dart';

class VisibilityOnScroll extends StatefulWidget {
  final Widget child;
  final double visibleFraction;
  final ScrollController scrollController;

  const VisibilityOnScroll({
    Key? key,
    required this.child,
    this.visibleFraction = 0.5,
    required this.scrollController, 
  }) : super(key: key);

  @override
  _VisibilityOnScrollState createState() => _VisibilityOnScrollState();
}

class _VisibilityOnScrollState extends State<VisibilityOnScroll> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final scrollPosition = widget.scrollController.position.pixels;
    final viewportHeight = widget.scrollController.position.viewportDimension;
    final widgetPosition = renderBox?.localToGlobal(Offset.zero);

    if (renderBox != null && widgetPosition != null) {
      final widgetHeight = renderBox.size.height;
      final widgetTop = widgetPosition.dy;
      final widgetBottom = widgetTop + widgetHeight;

      final visibleTop = widgetTop < scrollPosition + viewportHeight;
      final visibleBottom = widgetBottom > scrollPosition;

      final visibleHeight = (visibleBottom ? widgetBottom : scrollPosition + viewportHeight) -
                            (visibleTop ? widgetTop : scrollPosition);

      final fractionVisible = visibleHeight / widgetHeight;

      if (fractionVisible >= widget.visibleFraction) {
        setState(() {
          _isVisible = true;
        });
      } else {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: widget.child,
    );
  }
}

