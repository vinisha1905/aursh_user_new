import 'package:ayursh/domain/model/response/about_us_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutUsDetailArguments {
  final AboutUsModel aboutUsModel;

  const AboutUsDetailArguments(this.aboutUsModel);
}

class AboutUsDetailScreen extends StatefulWidget {
  static final String routName = '/about_us_detail';
  final AboutUsDetailArguments arguments;

  const AboutUsDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  AboutUsDetailScreenState createState() {
    return AboutUsDetailScreenState();
  }
}

class AboutUsDetailScreenState extends State<AboutUsDetailScreen> {
  late YoutubePlayerController _controller;
  late YoutubePlayer _player;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.arguments.aboutUsModel.videoUrl.split('/').last);
    _player = YoutubePlayer(
      showVideoProgressIndicator: false,
      controller: _controller,
      onReady: () {
        _controller.play();
      },
      onEnded: (_) {
        _controller.seekTo(Duration(seconds: 1));
        _controller.pause();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayerBuilder(
          builder: (ctx, widget1) {
            return Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Stack(
                children: [
                  Column(
                    children: [
                      _player,
                      Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                          child: Text('${widget.arguments.aboutUsModel.title}',
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.3,
                                  color: AppColors.darkGray,
                                  fontWeight: Constant.fontMedium)))
                    ],
                  ),
                  Positioned(
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black26),
                          child: Center(
                              child: Icon(Icons.close,
                                  color: Colors.white, size: 24))),
                    ),
                  ),
                ],
              ),
            );
          },
          player: _player,
          onEnterFullScreen: () async {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.landscapeLeft]);
            Future.delayed(const Duration(seconds: 1), () {
              _controller.play();
            });
          },
          onExitFullScreen: () {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
            Future.delayed(const Duration(seconds: 1), () {
              _controller.play();
            });
          },
        ),
      ),
    );
  }
}
