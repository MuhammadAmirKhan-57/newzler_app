import 'package:flutter/material.dart';


class CricketScoreScreen extends StatelessWidget {
  CricketScoreScreen({super.key});

  final List<Map<String, dynamic>> matches = [
    {
      'matchType': '2nd Test',
      'team1': 'India',
      'team2': 'Australia',
      'team1Score': '36/1 (11 ov)',
      'team2Score': '195',
      'team1Flag': 'assets/images/ind.png',
      'team2Flag': 'assets/images/aust.png',
      'result': 'India won by 5 wickets',
      'status': 'Stop', 
    },
    {
      'matchType': '1st ODI',
      'team1': 'England',
      'team2': 'New Zealand',
      'team1Score': '120/3 (15 ov)',
      'team2Score': '180',
      'team1Flag': 'assets/images/ind.png',
      'team2Flag': 'assets/images/aust.png',
      'result': 'Match in progress',
      'status': 'Live', // Added status
    },
    {
      'matchType': 'T20I',
      'team1': 'Pakistan',
      'team2': 'South Africa',
      'team1Score': '89/2 (10 ov)',
      'team2Score': '210',
      'team1Flag': 'assets/images/ind.png',
      'team2Flag': 'assets/images/aust.png',
      'result': 'South Africa leading',
      'status': 'Delay', // Added status
    },
  ];

  // Function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Live':
        return const Color(0xff2BA83F); // Green
      case 'Stop':
        return const Color(0xffDD0000); // Red
      case 'Delay':
        return const Color(0xff1E90FF); // Blue
      default:
        return const Color(0xff6B6E74); // Default grey
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                matches.length,
                (index) => GestureDetector(
                  onTap: () {
                   // Match Details Screen
                  },
                  child: Container(
                    width: 300,
                    height: 170,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                matches[index]['matchType'],
                                style: const TextStyle(
                                  color: Color(0xff6B6E74),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: _getStatusColor(matches[index]['status']),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    matches[index]['status'],
                                    style: TextStyle(
                                      color: _getStatusColor(matches[index]['status']),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      matches[index]['team1Flag'],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        matches[index]['team1'],
                                        style: const TextStyle(
                                          color: Color(0xff1A1A1A),
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
                                    matches[index]['team1Score'],
                                    style: const TextStyle(
                                      color: Color(0xff1A1A1A),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'V/S',
                                style: TextStyle(
                                  color: Color(0xff1E1A15),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      matches[index]['team2Flag'],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        matches[index]['team2'],
                                        style: const TextStyle(
                                          color: Color(0xff1A1A1A),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    matches[index]['team2Score'],
                                    style: const TextStyle(
                                      color: Color(0xff1A1A1A),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            matches[index]['result'],
                            style: const TextStyle(
                              color: Color(0xff6B6E74),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

