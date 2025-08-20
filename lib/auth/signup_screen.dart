import 'package:flutter/material.dart';
import 'package:newzler_app/auth/login_screen.dart';
import 'package:newzler_app/confirm/confirm_screen.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/onBoarding/onboarding_screen.dart';
import 'package:newzler_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstCtrl = TextEditingController();
  final TextEditingController _lastCtrl = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passWordCtrl = TextEditingController();

  @override
  void dispose() {
    _firstCtrl.dispose();
    _lastCtrl.dispose();
    super.dispose();
  }

  bool _checked = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                          builder: (context) => OnBoardingScreen(),
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    color: isDarkTheme ? Colors.white : Color(0XFF1E1A15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Create your Newzler account',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Your First Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                      ),
                    ),
                    SizedBox(width: 82),
                    Text(
                      'Your Last Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkTheme ? Colors.white : Color(0xff35312C),
                        ),
                        controller: _firstCtrl,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkTheme ? Colors.white : Color(0xff35312C),
                        ),
                        controller: _lastCtrl,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Text(
                  'CHOOSE YOUR USERNAME',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _fullName,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'YOUR EMAIL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'YOUR PASSWORD',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0xff3A3D46),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Color(0xff35312C),
                  ),
                  controller: _passWordCtrl,
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
                        color: Color(0xff979797),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.4,
                      child: Checkbox(
                        value: _checked,
                        onChanged: (v) => setState(() => _checked = v!),
                        shape: const CircleBorder(),
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(width: 1),
                    Expanded(
                      child: Text(
                        'I agree to the Newzler Terms of Service and Privacy Policy',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isDarkTheme ? Colors.white : Color(0xff27272E),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Sign Up',
                  color: Color(0xff209CEE),
                  textColor: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                      color: Colors.lightBlueAccent.withValues(alpha: 0.5),
                    ),
                  ],
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmScreen())),
                  
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff209CEE),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff209CEE),
                          decorationThickness: 1.2,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
