import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/profile/account_profile.dart';
import 'package:provider/provider.dart';

class PhoneUpdateScreen extends StatefulWidget {
  const PhoneUpdateScreen({super.key});

  @override
  State<PhoneUpdateScreen> createState() => _PhoneUpdateScreenState();
}

class _PhoneUpdateScreenState extends State<PhoneUpdateScreen> {
  final TextEditingController _mobileNumberController = TextEditingController(text: '1234567890');
  String _selectedCountryCode = '+91'; 

  final List<String> _countryCodes = ['+91', '+92', '+93', '+94', '+95']; 

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
              SizedBox(height: 20),
              Text(
                'Your mobile number',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color:isDarkTheme ? Colors.white : Color(0xFF1E1A15),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'YOUR MOBILE NUMBER',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color:isDarkTheme ? Colors.white : Color(0xFF3A3D46),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: _selectedCountryCode,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkTheme ? Colors.white :Color(0xFF1E1A15),
                            fontWeight: FontWeight.w600,
                          ),
                          underline: Container(
                            height: 0,
                            color: isDarkTheme ? Colors.white :Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCountryCode = newValue!;
                            });
                          },
                          items: _countryCodes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(width: 15),
                        Text('|',  style: TextStyle(
                        fontSize: 18,
                        color:isDarkTheme ? Colors.white : Color(0xFF1E1A15),
                        fontWeight: FontWeight.w600,
                      ),),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 16,
                              color:isDarkTheme ? Colors.white : Color(0xFF1E1A15),
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: isDarkTheme ? Colors.white :Color(0xFF1E1A15),
                      thickness: 1,
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Container(
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF209CEE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
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
    );
  }
}