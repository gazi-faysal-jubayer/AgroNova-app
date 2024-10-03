import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MissionCard extends StatefulWidget {
  final String? title;
  final String? description;
  final IconData? icon;
  final String? videoPath;
  final Function()? onTap;
  final List<Color>? gradientColors;
  final String? logoPath;

  const MissionCard({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.videoPath,
    this.onTap,
    this.gradientColors,
    this.logoPath,
  });

  @override
  _MissionCardState createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    if (widget.videoPath != null) {
      // Initialize video player
      _controller = VideoPlayerController.asset(widget.videoPath!)
        ..initialize().then((_) {
          setState(() {
            _controller.setLooping(true);
            _controller.play(); // Start playing the video
            _isPlaying = true;
          });
        }).catchError((error) {
          // Error handling
          print('Error loading video: $error');
        });

      // Listen for playback updates
      _controller.addListener(() {
        if (_controller.value.hasError) {
          print('Video Error: ${_controller.value.errorDescription}');
        }
        setState(() {}); // Ensure the video is updated
      });
    }
  }

  @override
  void dispose() {
    if (widget.videoPath != null) {
      _controller.dispose(); // Dispose controller when done
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Video background
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              width: 300,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: widget.videoPath != null && _controller.value.isInitialized
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
                  : Center(
                child: _isPlaying
                    ? CircularProgressIndicator() // Show loader if still initializing
                    : Text('Failed to load video.'),
              ),
            ),
          ),
        ),

        // Round logo positioned on top of the card
        if (widget.logoPath != null)
          Positioned(
            top: -40,
            left: 120,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.white, width: 3),
                image: DecorationImage(
                  image: AssetImage(widget.logoPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}