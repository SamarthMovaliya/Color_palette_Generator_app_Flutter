import 'dart:async';
import 'dart:convert';

import 'dart:math';
import 'package:color_pallete_generator_app/Controller/providers/ThemeProvider.dart';
import 'package:color_pallete_generator_app/views/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Controller/ColorControllerFunction.dart';
import 'Controller/LocalJsonConversion_Function.dart';
import 'Controller/providers/ColorProvider.dart';
import 'Modals/GlobalClass/GlobalColorClass.dart';
import 'Modals/global_resources/resources_attributes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ColorProvider(),
      ),
    ],
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Splashscreen',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode:
            (Provider.of<ThemeProvider>(context).themeModal.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
        routes: {
          'home': (context) => home(),
          'Splashscreen': (context) => SplashScreen(),
        },
      );
    },
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    loadData();
    allObjectColors = convertToObject();
    print(allObjectColors[20].hexColor.toString());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<ColorProvider>(context).changeColor();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: const Text(
          'Colors App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(
              Icons.sunny,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'COLOR PALETTE\n      Generator',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                  color:
                      (Provider.of<ThemeProvider>(context).themeModal.isDark ==
                              true)
                          ? Colors.grey.shade50
                          : Colors.blue,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 300,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Color(
                        hexColors(
                          allObjectColors[Provider.of<ColorProvider>(context)
                                  .colorModal
                                  .a]
                              .hexColor,
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        hexColors(
                          allObjectColors[Provider.of<ColorProvider>(context)
                                  .colorModal
                                  .b]
                              .hexColor,
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(
                          hexColors(
                            allObjectColors[Provider.of<ColorProvider>(context)
                                    .colorModal
                                    .c]
                                .hexColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(
                          hexColors(
                            allObjectColors[Provider.of<ColorProvider>(context)
                                    .colorModal
                                    .d]
                                .hexColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(
                          hexColors(
                            allObjectColors[Provider.of<ColorProvider>(context)
                                    .colorModal
                                    .e]
                                .hexColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                      color: Color(
                        hexColors(
                          listOfcolors[Provider.of<ColorProvider>(context)
                              .colorModal
                              .f]['hex'],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          const Spacer(),
          Expanded(
              child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Provider.of<ColorProvider>(context, listen: false).changeColor();
            },
            child: Container(
              height: 100,
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      (Provider.of<ThemeProvider>(context).themeModal.isDark ==
                              true)
                          ? Colors.grey.shade800
                          : Colors.blueGrey.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: (Provider.of<ThemeProvider>(context)
                                  .themeModal
                                  .isDark ==
                              true)
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      offset: const Offset(3, 4),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: (Provider.of<ThemeProvider>(context)
                                  .themeModal
                                  .isDark ==
                              true)
                          ? Colors.grey.shade600
                          : Colors.blueGrey.shade200,
                      offset: const Offset(-3, -4),
                      blurRadius: 5,
                    )
                  ]),
              child: Text(
                'Generate',
                style: TextStyle(
                    color: (Provider.of<ThemeProvider>(context)
                                .themeModal
                                .isDark ==
                            true)
                        ? Colors.grey.shade50
                        : Colors.blue.shade500,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    letterSpacing: 8),
              ),
            ),
          )),
          const Spacer()
        ],
      ),
      backgroundColor:
          (Provider.of<ThemeProvider>(context).themeModal.isDark == true)
              ? Colors.grey.shade700
              : Colors.blueGrey.shade50,
    );
  }
}
