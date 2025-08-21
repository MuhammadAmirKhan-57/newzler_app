import 'package:flutter/material.dart';
import 'package:newzler_app/auth/login_screen.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _passCtrl = TextEditingController();

  @override
  void dispose() {
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(25.0),
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
                          builder: (context) => LoginScreen(),
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
                const SizedBox(height: 30),
                 Text(
                  'Forgot your\npassword?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0XFF1E1A15),
                  ),
                ),
                const SizedBox(height: 10),
                 Text(
                  'Give your email address you used during registration',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'YOUR EMAIL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _passCtrl,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () => _passCtrl.clear(),
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff209CEE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email_outlined, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Recover',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
