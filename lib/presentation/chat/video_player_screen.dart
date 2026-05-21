import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ── Arguments ─────────────────────────────────────────────────────────────────
class VideoPlayerArguments {
  final String? url;        // remote Firebase URL
  final String? localPath;  // local file path (while uploading)

  const VideoPlayerArguments({this.url, this.localPath})
      : assert(url != null || localPath != null,
  'Either url or localPath must be provided');

  bool get isLocal => localPath != null && localPath!.isNotEmpty;
  String get source => localPath ?? url!;
}

// ── Screen ────────────────────────────────────────────────────────────────────
class VideoPlayerScreen extends StatefulWidget {
  static const String routName = '/video-player';
  final VideoPlayerArguments arguments;

  const VideoPlayerScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      if (widget.arguments.isLocal) {
        _controller = VideoPlayerController.file(
          File(widget.arguments.localPath!),
        );
      } else {
        _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.arguments.url!),
        );
      }

      await _controller.initialize();
      _controller.addListener(() => setState(() {}));
      setState(() => _initialized = true);
      _controller.play();
    } catch (e) {
      setState(() => _hasError = true);
      debugPrint('VideoPlayerScreen error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _hasError
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.white54, size: 48),
            SizedBox(height: 12),
            Text('Cannot play video',
                style: TextStyle(color: Colors.white54)),
          ],
        ),
      )
          : !_initialized
          ? Center(
          child: CircularProgressIndicator(color: Colors.white))
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Video
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          // Controls
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    final pos = _controller.value.position;
    final dur = _controller.value.duration;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Seekbar
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.white,
              bufferedColor: Colors.white30,
              backgroundColor: Colors.white12,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(_fmt(pos),
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
              Spacer(),
              // Play/Pause
              GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Spacer(),
              Text(_fmt(dur),
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}