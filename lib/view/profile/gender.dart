import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/profile/account_profile.dart';
import 'package:provider/provider.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? _selectedGender;

  final List<String> _gender = ['Male', 'Female', 'Not Sure', 'Other'];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
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
              const SizedBox(height: 25),
              Text(
                'Your Gender',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Color(0xFF1E1A15),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Select your gender',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: isDarkTheme ? Colors.white : Color(0xFF3A3D46),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text(
                  'Gender',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
                value: _selectedGender,
                isExpanded: true,
                items: _gender.map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 25),
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
    );
  }
}
