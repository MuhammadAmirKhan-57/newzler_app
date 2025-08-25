import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newzler_app/models/account_model.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString('profile_image');
      if (imagePath != null && File(imagePath).existsSync()) {
        setState(() {
          selectedImage = File(imagePath);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    final List<AccountModel> accountItem = [
      AccountModel(
          image: 'assets/images/notification 1.png',
          title: 'Notification',
          // screen: const NotificationScreen()
          ),
      AccountModel(
          image: 'assets/images/theme.png',
          title: 'Theme',
          // screen: const ThemeScreen()
          ),
      AccountModel(
          image: 'assets/images/bookmark 7.png',
          title: 'My Bookmarks',
          // screen: const MyBookMarkScreen()
          ),
      AccountModel(
          image: 'assets/images/interface.png',
          title: 'My Publisher',
          // screen: const MyPublishScreen()
          ),
      AccountModel(
          image: 'assets/images/language.png',
          title: 'My Languages',
          // screen: const MyLanguageScreen()
          ),
      AccountModel(
          image: 'assets/images/category 1.png',
          title: 'My Category',
          // screen: const MyCategoryScreen()
          ),
      AccountModel(
          image: 'assets/images/interface 1.png',
          title: 'About',
          // screen: const AboutScreen()
          ),
      AccountModel(
          image: 'assets/images/lock 1.png',
          title: 'Privacy',
          // screen: const PrivacyScreen()
          ),
      AccountModel(
          image: 'assets/images/document 2.png',
          title: 'Terms',
          // screen: const TermScreen()
          ),
      AccountModel(
          image: 'assets/images/share.png',
          title: 'Share the App',
          // screen: const ShareScreen()
          ),
      AccountModel(
          image: 'assets/images/star 5.png',
          title: 'Rate the App',
          // screen: const RateScreen()
          ),
      AccountModel(
          image: 'assets/images/facebook.png',
          title: 'Follow on Facebook',
          // screen: const FbScreen()
          ),
      AccountModel(
          image: 'assets/images/twitter.png',
          title: 'Follow on Twitter',
          // screen: const TwitterScreen()
          ),
      AccountModel(
          image: 'assets/images/instagram.png',
          title: 'Follow on Instagram',
          // screen: const InstaShareScreen()
          ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
               Text(
                'Account',
                style: TextStyle(
                  fontSize: 19,
                  color:isDarkTheme ? Colors.white : Color(0xff27272E),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 13),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {}, // Update Profile Screen
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: selectedImage != null
                            ? FileImage(selectedImage!)
                            : const AssetImage('assets/images/prof.png')
                                as ImageProvider,
                        onBackgroundImageError: (error, stackTrace) =>
                            const AssetImage('assets/images/prof.png'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                'Darrell Chan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                                ),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: () {}, //AccountSetting Screen
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xff209CEE),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    size: 16,
                                    color: Color(0xff209CEE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                           Text(
                            'abc123@example.com',
                            style: TextStyle(
                              fontSize: 12,
                              color:isDarkTheme ? Colors.white : Color(0xff7F7D7E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: accountItem.length,
                  itemBuilder: (context, i) {
                    final item = accountItem[i];
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: GestureDetector(
                        onTap: () {}, // Item Screen
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item.image,
                              width: 24,
                              height: 24,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff1E1A15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}