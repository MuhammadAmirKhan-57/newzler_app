import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart'; // For Clipboard

class TradingScreen extends StatefulWidget {
  const TradingScreen({super.key});

  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  final List<String?> _selectedEmojis = [null, null, null];

  final List<String> socialIcons = [
    'assets/images/h_icon 4.png',
    'assets/images/h_icon 2.png',
    'assets/images/h_icon 3.png',
    'assets/images/h_icon.png',
  ];

  final List<String> emojiIcons = [
    'assets/images/like.png',
    'assets/images/love.png',
    'assets/images/haha.png',
    'assets/images/wow.png',
    'assets/images/sad.png',
    'assets/images/angry.png',
  ];

  final List<Map<String, String>> shareIcons = [
    {'name': 'Facebook', 'icon': 'assets/images/f2.png'},
    {'name': 'WhatsApp', 'icon': 'assets/images/w2.png'},
    {'name': 'Twitter', 'icon': 'assets/images/t2.png'},
    {'name': 'Facebook', 'icon': 'assets/images/f2.png'},
    {'name': 'WhatsApp', 'icon': 'assets/images/w2.png'},
    {'name': 'Twitter', 'icon': 'assets/images/t2.png'},
   
  ];

  void _showEmojiBottomSheet(BuildContext context, int postIndex) {
    final isDarkTheme = Provider.of<ThemeProvider>(context, listen: false).selectedTheme == 'Night';
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 180,
          child: Column(
            children: [
               Text(
                'React',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(emojiIcons.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedEmojis[postIndex] = emojiIcons[index];
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        emojiIcons[index],
                        width: 50,
                        height: 50,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context, listen: false).selectedTheme == 'Night';
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 180,
          child: Column(
            children: [
               Text(
                'Share',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: shareIcons.map((social) {
                    return GestureDetector(
                      onTap: () {
                        if (social['name'] == 'Copy Link') {
                          Clipboard.setData(
                            const ClipboardData(text: 'https://example.com'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Link copied to clipboard'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Sharing to ${social['name']}'),
                            ),
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(social['icon']!, width: 35, height: 35),
                          const SizedBox(height: 4),
                          Text(
                            social['name']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Trading')),
      body: Column(
        children: [
          Divider(thickness: 1,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(3, (postIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              postIndex % 2 == 0
                                  ? 'assets/images/home 330.png'
                                  : 'assets/images/cri_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/images/h_icon 5.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                     Text(
                                      'A protester carries the Confederate flag\n after breaching US Capitol security,',
                                      style: TextStyle(
                                        color: isDarkTheme ? Colors.white : Color(0xff323232),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                     Text(
                                      '5 hours ago    |     News18',
                                      style: TextStyle(
                                        color:isDarkTheme ? Colors.white : Color(0xff464646),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:
                                  List.generate(socialIcons.length, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            if (index == 0) {
                                              _showEmojiBottomSheet(
                                                context,
                                                postIndex,
                                              );
                                            } else if (index ==
                                                socialIcons.length - 1) {
                                              _showShareBottomSheet(context);
                                            } else {
                                              setState(() {
                                                _selectedEmojis[postIndex] = null;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            index == 0 &&
                                                    _selectedEmojis[postIndex] != null
                                                ? _selectedEmojis[postIndex]!
                                                : socialIcons[index],
                                            width: 24,
                                            height: 24,
                                            color:
                                                index == 0 &&
                                                    _selectedEmojis[postIndex] == null
                                                ? Colors.grey
                                                : index != 0
                                                ? Colors.grey
                                                : null,
                                          ),
                                        );
                                      })
                                      .expand(
                                        (widget) => [
                                          widget,
                                          const SizedBox(width: 5),
                                        ],
                                      )
                                      .toList()
                                    ..removeLast(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
