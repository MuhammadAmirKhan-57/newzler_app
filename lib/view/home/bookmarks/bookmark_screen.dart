import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyBookMarkScreen extends StatelessWidget {
  const MyBookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookmark',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Divider(thickness: 1),
          Image.asset('assets/images/bookmarks_s.png'),
          SizedBox(height: 15),
          Text(
            textAlign: TextAlign.center,
            'Create an account or log in to Newzler\nto continue.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkTheme ? Colors.white :Color(0xff1E1A15),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {}, //Bookmark news screen
                child: Container(
                  width: 140,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xff209CEE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
               GestureDetector(
                onTap: () {},  //No bookmark sheet,
                 child: Container(
                  width: 140,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff979797)),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkTheme ? Colors.white : Color(0xff33333A),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                               ),
               ),
            ],
          ),
        ],
      ),
    );
  }
}
