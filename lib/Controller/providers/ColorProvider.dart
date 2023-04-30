import 'dart:math';

import 'package:color_pallete_generator_app/Modals/ColorModal.dart';
import 'package:flutter/material.dart';

import '../../Modals/global_resources/resources_attributes.dart';

class ColorProvider extends ChangeNotifier {
  ColorModal colorModal = ColorModal(a: 2, b: 3, c: 6, d: 10, e: 23, f: 7);

  changeColor() {
    colorModal.a = r1.nextInt(allObjectColors.length) + 1;
    colorModal.b = r1.nextInt(allObjectColors.length) + 1;
    colorModal.c = r1.nextInt(allObjectColors.length) + 1;
    colorModal.d = r1.nextInt(allObjectColors.length) + 1;
    colorModal.e = r1.nextInt(allObjectColors.length) + 1;
    colorModal.f = r1.nextInt(allObjectColors.length) + 1;
    notifyListeners();
  }
}
