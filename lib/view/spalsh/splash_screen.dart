import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/intro/intro_screen.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //   final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250),
            Image.asset(
              'assets/images/splash_icon.png',
              width: 144,
              height: 144,
            ),
            SizedBox(height: 60),
            Image.asset('assets/images/splash_icon1.png', color: isDarkTheme ? Colors.white : Colors.black,),
            SizedBox(height: 180),
            CircularProgressIndicator(color: Color(0xff209CEE)),
          ],
        ),
      ),
    );
  }
}
