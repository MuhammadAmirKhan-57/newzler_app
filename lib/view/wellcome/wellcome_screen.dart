import 'package:flutter/material.dart';
import 'package:newzler_app/auth/login_screen.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/Welcome.png', 
            width:  390, 
            height: 390),
            SizedBox(height:25),
            Text(
              'Welcome, Darrell',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff209CEE),
              ),
            ),
            SizedBox(height:  10),
            Text(
              'Enjoy our best news engine experience ever.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Container(
                width: 144,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff209CEE),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withValues(alpha: 0.4),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Let's Started",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
