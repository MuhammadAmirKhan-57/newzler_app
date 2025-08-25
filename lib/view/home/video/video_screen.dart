import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/home/video/video_section.dart';
import 'package:provider/provider.dart';


class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Video',
          style: TextStyle(
            fontSize: 16,
            color: isDarkTheme ? Colors.white : Color(0xff27272E),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 1),
              Text(
                'Live News',
                style: TextStyle(
                  fontSize: 18,
                  color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/live 1.png'),
                    SizedBox(width: 15),
                    Image.asset('assets/images/live 2.png'),
                    SizedBox(width: 15),
                    Image.asset('assets/images/live 3.png'),
                    SizedBox(width: 15),
                    Image.asset('assets/images/live 4.png'),
                    SizedBox(width: 15),
                    Image.asset('assets/images/live 1.png'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Recommend',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkTheme ? Colors.white :Color(0xff1A1A1A),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              VideoSection(
                videoUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
                thumbnailUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg',
                title:
                    'A protester carries the Confederate flag\n after breaching US Capitol security,',
                subtitle: '5 hours ago    |     News18',
              ),
              SizedBox(height: 10),
              VideoSection(
                videoUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
                thumbnailUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg',
                title: 'Global Economic Summit Highlights',
                subtitle: '4 hours ago    |     World News Network',
              ),
              SizedBox(height: 10),
              VideoSection(
                videoUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
                thumbnailUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg',
                title: 'Political Developments in Europe',
                subtitle: '3 hours ago    |     News Today',
              ),
              SizedBox(height: 10),
              VideoSection(
                videoUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
                thumbnailUrl:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg',
                title: 'Environmental Crisis Report',
                subtitle: '2 hours ago    |     Eco News',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

