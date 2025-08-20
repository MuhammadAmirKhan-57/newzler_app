import 'package:flutter/material.dart';
import 'package:newzler_app/auth/signup_screen.dart';
import 'package:newzler_app/models/boarding_model.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController controller = PageController();

  final List<BoardingModel> boardingList = [
    BoardingModel(
      image: 'assets/images/Group.png',
       title: 'Trending news'
       ),
    BoardingModel(
      image: 'assets/images/Group 1.png',
      title: 'React, Save & Share News',
    ),
    BoardingModel(
      image: 'assets/images/Group 2.png',
      title: 'Video & live News From YouTube',
    ),
    BoardingModel(
      image: 'assets/images/Group 3.png',
      title: 'Browse News From Variety Of Categories',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  itemCount: boardingList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Spacer(flex: 2),
                          Image.asset(
                            boardingList[i].image,
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.3,
                            fit: BoxFit.contain,
                          ),
                          Spacer(flex: 1),
                          Text(
                            boardingList[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: isDarkTheme ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 60,
                  right: 10,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff68686D),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: boardingList.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 8,
              dotColor: Colors.grey,
              activeDotColor: Color(0xff209CEE),
            ),
          ),

          SizedBox(height: screenHeight * 0.10),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
            child: Container(
              height: screenHeight * 0.065,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Color(0xff27272E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/message 1.png',height: 24, width: 24,),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Continue with Email',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.06),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _socialIcon('assets/images/logos_facebook.png'),
                SizedBox(width: screenWidth * 0.025),
                _socialIcon('assets/images/devicon_google.png'),
                SizedBox(width: screenWidth * 0.025),
                _socialIcon('assets/images/Vector.png'),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.06),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Color(0xffC4C4C4)),
        ),
        child: Image.asset(assetPath),
      ),
    );
  }
}
