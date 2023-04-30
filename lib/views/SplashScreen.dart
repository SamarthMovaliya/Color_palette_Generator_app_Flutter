import 'package:color_pallete_generator_app/Controller/LocalJsonConversion_Function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeTo() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }
  @override
  void initState() {
    loadData();
    changeTo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 40, end: 0),
              duration: const Duration(seconds: 3),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  child: const Image(
                    image: AssetImage('assets/logo/color.png'),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ' COLOR\nPALETTE',
              style: GoogleFonts.racingSansOne(
                  fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 18),
            ),
          ],
        ),
      ),
    );
  }
}
