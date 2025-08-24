import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:newzler_app/view/home/video/video_payer.screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String title;
  final String subtitle;

  const VideoSection({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  VideoPlayerController? _controller;
  String? _duration;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  Future<void> _initializeVideoController() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _duration = _formatDuration(_controller!.value.duration);
        });
      }
    } catch (e) {
      print('Error initializing video controller: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return hours > 0
        ? '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}'
        : '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoUrl: widget.videoUrl, avatarText: '',),
                ),
              );
            }, //Video Player Screen
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      widget.thumbnailUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Thumbnail load error: $error');
                        return Container(
                          color: Colors.grey,
                          child: Center(child: Text('Thumbnail failed to load')),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
                Icon(
                  Icons.play_circle_filled,
                  size: 50,
                  color: Colors.white.withOpacity(0.8),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _duration ?? 'Loading...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  'assets/images/h_icon 5.png',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color:isDarkTheme ? Colors.white : Color(0xff323232),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          color: isDarkTheme ? Colors.white : Color(0xff464646),
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}