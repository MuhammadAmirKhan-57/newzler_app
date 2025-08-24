import 'package:flutter/material.dart';
import 'package:newzler/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String avatarText;

   VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.avatarText,
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _showControls = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      if (!Uri.parse(widget.videoUrl).isAbsolute) {
        setState(() {
          _errorMessage = 'Invalid video URL';
        });
        print('Invalid video URL: ${widget.videoUrl}');
        return;
      }

      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _controller!.play();
        });
        _controller!.addListener(() {
          setState(() {}); // Update progress bar
        });
      }
    } catch (e, stackTrace) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load video: $e';
        });
        print('VideoPlayerController error: $e\nStackTrace: $stackTrace');
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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

  void _toggleFullScreen() {
    print('Toggle full screen');
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      body: SafeArea(
        child: _errorMessage != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_errorMessage!, textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _errorMessage = null;
                        _isInitialized = false;
                        _controller?.dispose();
                        _controller = null;
                      });
                      _initializeVideoPlayer();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              )
            : Column(
                children: [
                  
                  AspectRatio(
                    aspectRatio: _controller?.value.aspectRatio ?? 16 / 9,
                    child: _isInitialized && _controller != null
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(_controller!),
                             
                              Positioned(
                                top: 10,
                                left: 10,
                                child: AnimatedOpacity(
                                  opacity: _showControls ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ),
                              
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showControls = !_showControls;
                                    if (!_controller!.value.isPlaying) {
                                      _controller!.play();
                                    }
                                  });
                                },
                                child: _controller!.value.isPlaying &&
                                        !_showControls
                                    ? Container()
                                    : Icon(
                                        _controller!.value.isPlaying
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_filled,
                                        size: 50,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                              ),
                              
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: AnimatedOpacity(
                                  opacity: _showControls ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _controller!.value.isInitialized
                                              ? _formatDuration(
                                                  _controller!.value.position)
                                              : '00:00',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            child: VideoProgressIndicator(
                                              _controller!,
                                              allowScrubbing: true,
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 8,
                                              ),
                                              colors: const VideoProgressColors(
                                                playedColor: Colors.red,
                                                bufferedColor: Colors.white70,
                                                backgroundColor: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          _controller!.value.isInitialized
                                              ? _formatDuration(
                                                  _controller!.value.duration)
                                              : '00:00',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.fullscreen,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          onPressed: _toggleFullScreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                          
                            Text(
                              "Trump presidency's final days: 'In his\nmind, he will not have lost'",
                              style: TextStyle(
                                fontSize: 18,
                                color: isDarkTheme ? Colors.white : Color(0xff323232),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time-circle 1.png',
                                  width: 16,
                                  height: 16,
                                  color: isDarkTheme ? Colors.white :Color(0xff707070),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "1h | US & Canada",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: isDarkTheme ? Colors.white :Color(0xff707070),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 1),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('assets/images/h_icon 5.png'),
                                  onBackgroundImageError:
                                      (error, stackTrace) => Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                ),
                                SizedBox(width: 13),
                                Text(
                                  "News18",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDarkTheme ? Colors.white : Color(0xff323232),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 1),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/v1.png',
                                            width: 140,
                                            height: 85,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 140,
                                              height: 85,
                                              color: Colors.grey,
                                              child: Icon(
                                                  Icons.error, color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Meet the woman behind India's best bar",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: isDarkTheme ? Colors.white :Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "4 minutes ago  |   Rebecca Cairns",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: isDarkTheme ? Colors.white : Color(0xff707070),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/v2.png',
                                            width: 140,
                                            height: 85,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 140,
                                              height: 85,
                                              color: Colors.grey,
                                              child: Icon(
                                                  Icons.error, color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "What's gone wrong at Ferrari and can Formula One's most successful team bounce back in 2021?",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "4 minutes ago  |   Rebecca Cairns",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color:isDarkTheme ? Colors.white : Color(0xff707070),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/v1.png',
                                            width: 140,
                                            height: 85,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 140,
                                              height: 85,
                                              color: Colors.grey,
                                              child: Icon(
                                                  Icons.error, color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Meet the woman behind India's best bar",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "4 minutes ago  |   Rebecca Cairns",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color:isDarkTheme ? Colors.white : Color(0xff707070),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/v2.png',
                                            width: 140,
                                            height: 85,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 140,
                                              height: 85,
                                              color: Colors.grey,
                                              child: Icon(
                                                  Icons.error, color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "What's gone wrong at Ferrari and can Formula One's most successful team bounce back in 2021?",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:isDarkTheme ? Colors.white : Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "4 minutes ago  |   Rebecca Cairns",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color:isDarkTheme ? Colors.white : Color(0xff707070),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}