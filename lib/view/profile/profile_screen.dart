import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? file;
  Future<void> pickedImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How you will\nappear?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                ),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: pickedImage,
                child: Center(
                  child: ClipOval(
                    child: file != null
                        ? Image.file(
                            file!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/prof.png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              CustomButton(
                color: Color.fromRGBO(32, 156, 238, 1),
                text: 'Continue',
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                    color: Colors.lightBlueAccent.withValues(alpha: 0.5),
                  ),
                ],
                onTap: () {},
                textColor: Color(0xffFFFFFF),
              ),
              SizedBox(height: 25),
              CustomButton(
                text: 'Skip',
                color:  Colors.transparent,
                textColor: isDarkTheme ? Colors.white : Color(0xff27272E),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffC4C4C4)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
