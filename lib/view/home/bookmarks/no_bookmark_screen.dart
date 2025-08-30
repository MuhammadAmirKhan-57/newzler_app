import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class NoBookMarkSheet extends StatelessWidget {
  const NoBookMarkSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookmark',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Divider(thickness: 1),
          Image.asset('assets/images/bookmarks_s1.png'),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            'Your bookshelf has no news',
            style: TextStyle(
              fontSize: 16,
              color:isDarkTheme ? Colors.white : Color(0xff1E1A15),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
