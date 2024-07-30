import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomChip extends StatefulWidget {
  final String name;
  final String brandName;
  const CustomChip({super.key, required this.name, required this.brandName});

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  Color _color = Colors.white;
  Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _color = Colors.black;
          _textColor = Colors.white;
        });
      },
      onExit: (event) {
        setState(() {
          _color = Colors.white;
          _textColor = Colors.black;
        });
      },
      child: Chip(
        avatar: Brand(widget.brandName),
        label: Text(
          widget.name,
          style: TextStyle(color: _textColor),
        ),
        backgroundColor: _color,
      ),
    );
  }
}
