import 'package:flutter/material.dart';
import 'package:newzler/provider/theme_provider.dart';
import 'package:newzler/view/account/my-bookmark/custom_bookmark.dart';
import 'package:provider/provider.dart';

class BookmarkNewsScreen extends StatefulWidget {
  const BookmarkNewsScreen({super.key});

  @override
  _BookmarkNewsScreenState createState() => _BookmarkNewsScreenState();
}

class _BookmarkNewsScreenState extends State<BookmarkNewsScreen> {
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
        actions: [
          IconButton(
            onPressed: () {
              bool isDeletePressed = false;
              showDialog(
                context: context,
                builder: (BuildContext context) => StatefulBuilder(
                  builder: (context, setDialogState) => AlertDialog(
                    contentPadding: const EdgeInsets.only(top: 0, bottom: 8), // Reduced padding
                    title:  Text(
                      'Are you sure you want to delete from your bookmark?',
                      style: TextStyle(
                        fontSize: 18,
                        color:isDarkTheme ? Colors.white : Color(0xff1E1A15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(thickness: 1),
                      ],
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextButton(
                              onPressed: () {
                                setDialogState(() {
                                  isDeletePressed = true;
                                });
    
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: isDeletePressed ? Colors.grey :  Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8), 
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel', style: TextStyle(
                                color: isDarkTheme ? Colors.white : Colors.grey,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/document 2.png',
                  color: isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                ),
                const SizedBox(width: 3),
                Text(
                  'News',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkTheme ? Colors.white :Color(0xff1E1A15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          BookmarkNewsItem(
            imagePath: 'assets/images/News 19.png',
            title: "Covid: Dr Scott Atlas - Trump's\ncontroversial coronavirus adviser - \nresigns",
            subtitle: "4 minutes ago  |   US & Canada",
          ),
          BookmarkNewsItem(
            imagePath: 'assets/images/News 20.png',
            title: "UNS 1st December 1945 - Singer\nBette Midler",
            subtitle: "4 minutes ago  |   US & Canada",
          ),
        ],
      ),
    );
  }
}
