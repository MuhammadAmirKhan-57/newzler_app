import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/home/account/notification/cricket/cricket_screen.dart';


class MatchDetailScreen extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const MatchDetailScreen({super.key, required this.matchData});

  // Function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Live':
        return const Color(0xff2BA83F);
      case 'Stop':
        return const Color(0xffDD0000);
      case 'Delay':
        return const Color(0xff1E90FF);
      default:
        return const Color(0xff6B6E74);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
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
                          builder: (context) => CricketScoreScreen(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _getStatusColor(matchData['status']),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          matchData['status'],
                          style: TextStyle(
                            color: _getStatusColor(matchData['status']),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    '${matchData['team1']} v/s ${matchData['team2']}\n${matchData['matchType']}',
                    style:  TextStyle(
                      fontSize: 32,
                      color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    "2nd Test, India tour of Australia \nMelbourne Cricket Ground, Australia",
                    style:  TextStyle(
                      color:isDarkTheme ? Colors.white : Color(0xff6B6E74),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image.asset(matchData['team1Flag']),
                          ),
                          Row(
                            children: [
                              Text(
                                matchData['team1'],
                                style:  TextStyle(
                                  color: isDarkTheme ? Colors.white :Color(0xff1A1A1A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffDD0000),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            matchData['team1Score'],
                            style:  TextStyle(
                              color: isDarkTheme ? Colors.white :Color(0xff1A1A1A),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                       Text(
                        'V/S',
                        style: TextStyle(
                          color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image.asset(matchData['team2Flag']),
                          ),
                          Row(
                            children: [
                              Text(
                                matchData['team2'],
                                style:  TextStyle(
                                  color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            matchData['team2Score'],
                            style:  TextStyle(
                              color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    matchData['result'],
                    style:  TextStyle(
                      color: isDarkTheme ? Colors.white :Color(0xff1A1A1A),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PLAYER OF THE MATCH',
                        style:  TextStyle(
                          color: isDarkTheme ? Colors.white :Color(0xff6B6E74),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/images/Player.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ajinkya Rahane',
                                  style:  TextStyle(
                                    color: isDarkTheme ? Colors.white : Color(0xff6B6E74),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'India',
                                  style:  TextStyle(
                                    color: isDarkTheme ? Colors.white :Color(0xff6B6E74),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
                Center(
                  child: Container(
                    width: 330,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff209CEE),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Read the full scoreboard',
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: RichText(
                    text:  TextSpan(
                      children: [
                        TextSpan(
                          text: 'Powered By ',
                          style: TextStyle(
                            color:isDarkTheme ? Colors.white : Color(
                              0xff6B6E74,
                            ), 
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'ESPNcricinfo',
                          style: TextStyle(
                            color: Color(0xff0052CC), // Blue for "ESPNcricinfo"
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
