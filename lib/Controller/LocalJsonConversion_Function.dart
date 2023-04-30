import 'dart:convert';

import 'package:color_pallete_generator_app/Modals/GlobalClass/GlobalColorClass.dart';
import 'package:flutter/services.dart';

import '../Modals/global_resources/resources_attributes.dart';

loadData() async {
  var data = await rootBundle.loadString(file);
  listOfcolors = jsonDecode(data);
}

List<ColorClass> convertToObject() {
  var allObjectColors =
      listOfcolors.map((e) => ColorClass.fromList(data: e)).toList();
  return allObjectColors;
}
