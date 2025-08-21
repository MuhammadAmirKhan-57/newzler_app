import 'package:flutter/material.dart';
import 'package:newzler_app/auth/signup_screen.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/forgot/forgot_email.dart';
import 'package:newzler_app/view/forgot/forgot_pass.dart';
import 'package:newzler_app/view/home/home_screen.dart';
import 'package:newzler_app/view/wellcome/wellcome_screen.dart';
import 'package:newzler_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passWordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passWordCtrl.dispose();
    super.dispose();
  }

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WellcomeScreen())), //Wellcome Screen
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
                SizedBox(height: 30),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? Colors.white : Color(0XFF1E1A15),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Using your email or username and password',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'YOUR EMAIL/USERNAME',
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
                    color: isDarkTheme ? Colors.white: Color(0xff35312C),
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
                        color: isDarkTheme ? Colors.white : Color(0xff979797),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50),
                CustomButton(
                  color: Color.fromRGBO(32, 156, 238, 1),
                  text: 'Login',
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                      color: Colors.lightBlueAccent.withValues(alpha: 0.5),
                    ),
                  ],
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())), //Home Screen
                  textColor: Color(0xffFFFFFF),
                ),
                SizedBox(height: 140),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassScreen())), //Forgot Screen
                    child: Text(
                      'Forgot your Password?',
                      style: TextStyle(color: isDarkTheme ? Colors.white : Color(0xff000000)),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotEmailScreen())), //Forgot Email Screen
                    child: Text(
                      'Forgot your Username?',
                      style: TextStyle(color: isDarkTheme ? Colors.white : Color(0xff000000)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDarkTheme ? Colors.white : Color(0xff000000),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      ),
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff209CEE),
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
