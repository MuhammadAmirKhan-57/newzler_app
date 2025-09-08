import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/profile/birthday_screen.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account Setting',
          style: TextStyle(
            fontSize: 19,
            color: isDarkTheme ? Colors.white :Color(0xff27272E),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        minimum: EdgeInsets.zero, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 1),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Color(0xff1e1a15),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Darrell Chan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () {}, // Name Update Screen
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),           
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'USERNAME',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Darrell',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EMAIL ADDRESS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'abc@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () {}, //Email Update Screen
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MOBILE NUMBER',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '+91-1234567890',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () {},  // Phone Update Screen
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BIRTHDAY',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'December 8, 1990',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayScreen())),
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GENDER',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkTheme ? Colors.white :Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () {}, //Gender Screen
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COUNTRY',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INDIA (मराठी)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                        InkWell(
                          onTap: () {}, //Country Screen
                          child: Icon(Icons.arrow_forward_ios, size: 22)),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TIMEZONE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Asia/Kolkata',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkTheme ? Colors.white :Color(0xff323232),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LAST LOGIN',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'January 18, 2021 02:32 PM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MEMBER SINCE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                      ),
                    ),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'January 18, 2021',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:isDarkTheme ? Colors.white : Color(0xff323232),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 5), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Divider(thickness: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}