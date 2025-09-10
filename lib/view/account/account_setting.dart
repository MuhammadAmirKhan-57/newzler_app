import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/account/change_password.dart';
import 'package:newzler_app/view/account/create_password.dart';
import 'package:newzler_app/view/profile/account_profile.dart';
import 'package:provider/provider.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

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
            color:isDarkTheme ? Colors.white : Color(0xff27272E),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 1),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 17,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: InkWell(
                onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile())),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color:isDarkTheme ? Colors.white : Color(0xff323232),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              
              title: Text(
                'Profile Photo',
                style: TextStyle(
                  fontSize: 17,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 17,
                  color:isDarkTheme ? Colors.white : Color(0xff323232),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen())),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              
              title: Text(
                'Create Password',
                style: TextStyle(
                  fontSize: 17,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePasswordScreen())), //Create  Password Screen
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: isDarkTheme ? Colors.white :Color(0xff323232),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 17,
                color:isDarkTheme ? Colors.white : Color(0xff323232),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Logout From All Devices',
              style: TextStyle(
                fontSize: 17,
                color:isDarkTheme ? Colors.white : Color(0xff323232),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Delete Account',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xffEA4235),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
