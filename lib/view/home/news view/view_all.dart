import 'package:flutter/material.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {

  int? _selectedMyViewIcon; 

  final List<String> viewIcon = [
     'assets/images/h_icon 4.png',
    'assets/images/h_icon 2.png',
    'assets/images/h_icon 3.png',
    'assets/images/h_icon.png',
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/home 2.png'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      child: Image(
                        image: AssetImage('assets/images/h_icon 5.png'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 93,
                      color: const Color(0xffBB1F19),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Trump presidency's final\ndays: 'In his mind, he will\nnot have lost'",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffB2B2B2),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(viewIcon.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                 _selectedMyViewIcon = index; 
                                });
                              },
                              child: Image.asset(
                                viewIcon[index],
                                width: 24,
                                height: 24,
                                color: _selectedMyViewIcon == index
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            );
                          }).expand((widget) => [widget, const SizedBox(width: 5)]).toList()
                            ..removeLast(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 310,
                          height: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xffBB1F19),
                          ),
                          child: Center(child: Text('Read the full story',  style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                            ),),),
                        ),
                      ),
                      SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}