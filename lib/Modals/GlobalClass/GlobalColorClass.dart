import 'package:flutter/material.dart';

class ColorClass {
  String hexColor;

  ColorClass({required this.hexColor});

  factory ColorClass.fromList({required Map data}) {
    return ColorClass(hexColor: data['hex']);
  }
}
