import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/home/trading/trading_screen.dart';
import 'package:newzler_app/view/home/video/video_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentPage = 0;
  int _selectedItem = 0;
  int? _selectedMyNewsIcon;
  int? _selectedSocialIcon;

  final List<String> tabs = [
    'My News',
    'World',
    'Business',
    'Health',
    'Travel',
  ];
  final List<String> images = [
    'assets/images/home 1.png',
    'assets/images/home 2.png',
    'assets/images/home 1.png',
  ];

  final List<Map<String, dynamic>> trendingItems = [
    {'text': 'Trending-1', 'width': 130.0, 'height': 35.0},
    {'text': 'Trending-2', 'width': 130.0, 'height': 35.0},
    {'text': 'Trending-3', 'width': 130.0, 'height': 35.0},
  ];

  final List<Widget> screenList = [
    const Placeholder(),
    const TradingScreen(),
    const VideoScreen(),
    // NewsSearchScreen(),
    // const AccountScreen(),
  ];

  final List<String> socialIcons = [
    'assets/images/h_icon 4.png',
    'assets/images/h_icon 2.png',
    'assets/images/h_icon 3.png',
    'assets/images/h_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: _selectedItem == 0
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 541,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          PageView.builder(
                            itemCount: images.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 541,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  List.generate(tabs.length, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                tabs[index],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: _selectedIndex == index
                                                      ? Colors.blue
                                                      : const Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              if (_selectedIndex == index)
                                                Container(
                                                  height: 2,
                                                  width: 30,
                                                  color: Colors.blue,
                                                ),
                                            ],
                                          ),
                                        );
                                      })
                                      .expand(
                                        (widget) => [
                                          widget,
                                          const SizedBox(width: 25),
                                        ],
                                      )
                                      .toList()
                                    ..removeLast(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 350,
                              left: 15.0,
                              right: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/h_icon 5.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'News18',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          '1h|US & Canada',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Trump presidency\'s final days: \'In his \nmind, he will not have lost\'',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children:
                                      List.generate(socialIcons.length, (index,) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedSocialIcon = index;
                                                });
                                              },
                                              child: Image.asset(
                                                socialIcons[index],
                                                width: 24,
                                                height: 24,
                                                color: _selectedSocialIcon == index ? Colors.blue : Colors.grey,
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
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(3, (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _currentPage = index;
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 4.0,
                                                  ),
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentPage == index
                                                    ? Colors.blue
                                                    : Colors.grey,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {}, //View All Screen
                                      child: const Text(
                                        'View all >',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        'Trending',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkTheme ? Colors.white : Color(0xff323232),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final item = trendingItems[index];
                          return ClipRect(
                            child: Container(
                              width: item['width'],
                              height: item['height'],
                              decoration: BoxDecoration(
                                color: const Color(0xffF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                item['text'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff27272E),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        'My News',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkTheme ? Colors.white : Color(0xff323232),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/home 330.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/images/h_icon 5.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'A protester carries the Confederate flag\n after breaching US Capitol security,',
                                      style: TextStyle(
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Color(0xff323232),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '5 hours ago    |     News18',
                                      style: TextStyle(
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Color(0xff464646),
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
                                            setState(() {
                                              _selectedMyNewsIcon = index;
                                            });
                                          },
                                          child: Image.asset(
                                            socialIcons[index],
                                            width: 24,
                                            height: 24,
                                            color: _selectedMyNewsIcon == index
                                                ? Colors.blue
                                                : Colors.grey,
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
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )
          : screenList[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        selectedItemColor: isDarkTheme ? Colors.white : Colors.black,
        unselectedItemColor: isDarkTheme ? Colors.grey : Colors.grey,
        selectedIconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_h.png',
              width: 24,
              height: 24,
              color: _selectedItem == 0
                  ? (isDarkTheme ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_h2.png',
              width: 24,
              height: 24,
              color: _selectedItem == 1
                  ? (isDarkTheme ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
            label: 'Trading',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_h3.png',
              width: 24,
              height: 24,
              color: _selectedItem == 2
                  ? (isDarkTheme ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_h4.png',
              width: 24,
              height: 24,
              color: _selectedItem == 3
                  ? (isDarkTheme ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_h5.png',
              width: 24,
              height: 24,
              color: _selectedItem == 4
                  ? (isDarkTheme ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
