import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ConfirmScreen extends StatelessWidget {
  ConfirmScreen({super.key});

  final TextEditingController _confPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirm your email address',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'CONFIRMATION CODE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                SizedBox(height: 10),
                TextField( 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Color(0xff35312C),
                    letterSpacing: 5,
                  ),
                  controller: _confPass,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Please check your email svarup03@gmail.com to confirm your registration',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                  ),
                ),
                SizedBox(height: 70),
                 CustomButton(
                  color: Color.fromRGBO(32, 156, 238, 1),
                  text: 'Continue',
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                      color: Colors.lightBlueAccent.withValues(alpha: 0.5),
                    )
                  ],
                  onTap: () {}, 
                  textColor: Color(0xffFFFFFF),
                ),
                  SizedBox(height: 25),
                  CustomButton(
                    text: 'Resand',
                    color: Colors.transparent, 
                    textColor: isDarkTheme ? Colors.white : Color(0xff27272E), 
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xffC4C4C4),
                    ),
                    onTap: () => Navigator.pop(context),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
