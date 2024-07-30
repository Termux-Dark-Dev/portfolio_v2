import 'package:flutter/material.dart';

class SizeHelper{
  SizeHelper._();

  static Size getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}