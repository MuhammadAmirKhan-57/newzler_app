import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/home/account/account_screen.dart';
import 'package:provider/provider.dart';


class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _passConfirm = TextEditingController();

  @override
  void dispose() {
    _newPassword.dispose();
    _passConfirm.dispose();
    super.dispose();
  }

 
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account Stting',
          style: TextStyle(
            fontSize: 19,
            color: isDarkTheme ? Colors.white : Color(0xff27272E),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 1),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Create password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color:isDarkTheme ? Colors.white : Color(0XFF1E1A15),
                ),
              ),
            ),
            SizedBox(height: 20),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18),
               child: Text(
                'YOUR NEW PASSWORD',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                ),
                           ),
             ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:isDarkTheme ? Colors.white : Color(0xff35312C),
                ),
                controller: _newPassword,
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
            ),
              SizedBox(height: 18),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18),
               child: Text(
                'CONFIRM YOUR NEW PASSWORD',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color:isDarkTheme ? Colors.white : Color(0xff3A3D46),
                ),
                           ),
             ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:isDarkTheme ? Colors.white : Color(0xff35312C),
                ),
                controller: _passConfirm,
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
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountScreen()),
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
                      'Create',
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
    );
  }
}
