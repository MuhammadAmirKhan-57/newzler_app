import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/language/all_languages.dart';
import 'package:provider/provider.dart';

class LanguageScareen extends StatefulWidget {
  const LanguageScareen({super.key});

  @override
  State<LanguageScareen> createState() => _LanguageScareenState();
}

class _LanguageScareenState extends State<LanguageScareen> {
  final _languages = ['English', 'Polish', 'Hindi', 'Urdu', 'Persian'];
  var _selectedLang = 'English';

  void _onDropSelected(String newValue) {
    setState(() {
      _selectedLang = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Image.asset('assets/images/lang.png'),
              SizedBox(height: 15),
              Text(
                'Which languages you prefer to read the\nnews?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkTheme ? Colors.white : Color(0xff27272E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 320,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xffC4C4C4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff209CEE),
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedLang,
                        items: _languages.map((String dropDownLang) {
                          return DropdownMenuItem<String>(
                            value: dropDownLang,
                            child: Text(dropDownLang),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          _onDropSelected(newValue!);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 20,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xffC4C4C4)),
                      ),
                      child: Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: isDarkTheme
                                ? Colors.white
                                : Color(0xff27272E),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePickerScreen())),
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff209CEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
