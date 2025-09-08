import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/profile/account_profile.dart';
import 'package:provider/provider.dart';


class EmailUpdateScreen extends StatefulWidget {
  const EmailUpdateScreen({super.key});

  @override
  State<EmailUpdateScreen> createState() => _EmailUpdateScreenState();
}

class _EmailUpdateScreenState extends State<EmailUpdateScreen> {
  final TextEditingController _currentP = TextEditingController();
  final TextEditingController _newE = TextEditingController();
  final TextEditingController _newEc = TextEditingController();

  @override
  void dispose() {
    _newE.dispose();
    _newEc.dispose();
    super.dispose();
  }

 
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/arrow-1.png',
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/close-1.png',
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Your Email Address',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white :Color(0XFF1E1A15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'YOUR CURRENT PASSWORD',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _currentP,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color:isDarkTheme ? Colors.white : Color(0xff979797),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 18),
                 Text(
                  'YOUR NEW EMAIL ADDRESS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                             ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _newE,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  ),
                ),
                  SizedBox(height: 18),
                 Text(
                  'CONFIRM YOUR NEW EMAIL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                             ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _newEc,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  ),
                  child: Center(
                    child: Container(
                      width: 320,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff209CEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
