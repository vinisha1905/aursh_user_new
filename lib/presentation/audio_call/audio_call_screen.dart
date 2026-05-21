import 'dart:async';
import 'dart:ui';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioCallArguments {
  final String rtcToken;
  final String consultationBookingId;
  final String userId;
  final String doctorImage;
  final String doctorName;

  AudioCallArguments(this.rtcToken, this.consultationBookingId, this.userId,
      this.doctorImage, this.doctorName);
}

class AudioCallScreen extends StatefulWidget {
  static final String routName = '/audio_call';

  final AudioCallArguments arguments;

  AudioCallScreen({required this.arguments});

  @override
  AudioCallScreenState createState() => AudioCallScreenState();
}

class AudioCallScreenState extends State<AudioCallScreen> {
  late final RtcEngine _engine;
  bool openMicrophone = true, enableSpeakerphone = true, playEffect = false;
  String connectionState = 'Connecting...';
  Timer? timer;
  int callDuration = 0;

  @override
  void initState() {
    super.initState();
    openMicrophone = true;
    enableSpeakerphone = false;
    callDuration = 0;
    _initEngine();
  }

  @override
  void dispose() {
    timer?.cancel();
    _leaveChannel();
    // _engine.destroy();
    super.dispose();
  }

  _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: Constant.agoraAppId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    this._addListeners();

    await _engine.enableAudio();
    await _engine
        .setChannelProfile(ChannelProfileType.channelProfileCommunication);
    await _engine.adjustPlaybackSignalVolume(100);
    await _engine.adjustRecordingSignalVolume(100);
    _joinChannel();
  }

  _addListeners() {
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            connectionState = 'Connected';
          });
          timer = Timer.periodic(Duration(seconds: 1), (timer) {
            setState(() {
              callDuration += 1;
            });
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    // _leaveChannel();
    //     Navigator.of(context).pop();
  }

  _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      var status = await Permission.microphone.request();
    }

    await _engine
        .joinChannelWithUserAccount(
            token: widget.arguments.rtcToken,
            channelId: widget.arguments.consultationBookingId,
            userAccount: widget.arguments.userId)
        .catchError((onError) {
      print('error ${onError.toString()}');
    });
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
  }

  _switchMicrophone() {
    _engine.enableLocalAudio(!openMicrophone).then((value) {
      setState(() {
        openMicrophone = !openMicrophone;
      });
    }).catchError((err) {
      print('enableLocalAudio $err');
    });
  }

  _switchSpeakerphone() {
    _engine.setEnableSpeakerphone(!enableSpeakerphone).then((value) {
      setState(() {
        enableSpeakerphone = !enableSpeakerphone;
      });
    }).catchError((err) {
      print('setEnableSpeakerphone $err');
    });
  }

  _switchEffect() async {
    if (playEffect) {
      _engine.stopEffect(1).then((value) {
        setState(() {
          playEffect = false;
        });
      }).catchError((err) {
        print('stopEffect $err');
      });
    } else {
      var filePath =
          await _engine.getAssetAbsolutePath('assets/sounds/basic_tone.mp3') ??
              '';
      _engine
          .playEffect(
              soundId: 1,
              filePath: filePath,
              loopCount: -1,
              pitch: 1,
              pan: 1,
              gain: 100,
              publish: true)
          .then((value) {
        setState(() {
          playEffect = true;
        });
      }).catchError((err) {
        print('playEffect $err');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<NotificationBloc, NotificationState>(
          bloc: GetIt.I.get<NotificationBloc>(),
          listener: (ctx, state) {
            if (state.notifications.last.title == 'Audio Call') {
              _leaveChannel();
              Navigator.of(context).pop();
            }
          },
          listenWhen: (state1, state2) {
            return state1.notifications.length != state2.notifications.length;
          },
          builder: (ctx, state) {
            return Stack(
              children: [
                Positioned(
                  top: 24,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CachedNetworkImage(
                    imageUrl: widget.arguments.doctorImage,
                    progressIndicatorBuilder: (ctx, url, downloadProgess) {
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.darkYellow));
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      color: Colors.white12,
                    ),
                  ),
                ),
                Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        ClipOval(
                            child: Container(
                          width: 160,
                          height: 160,
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                imageUrl: widget.arguments.doctorImage,
                                width: 160,
                                height: 160,
                                fit: BoxFit.fill,
                                errorWidget: (ctx, a, b) {
                                  return Container(
                                    color: AppColors.grayLight,
                                  );
                                },
                              )),
                        )),
                        SizedBox(height: 24),
                        Text(widget.arguments.doctorName,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text(_durationToTime(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 12),
                        Text(connectionState,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14)),
                      ],
                    )),
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: Container()),
                          GestureDetector(
                            onTap: () {
                              _switchMicrophone();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.black38,
                              ),
                              child: Icon(
                                openMicrophone ? Icons.mic : Icons.mic_off,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                          Expanded(flex: 2, child: Container()),
                          GestureDetector(
                            onTap: () {
                              _switchSpeakerphone();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.black38,
                              ),
                              child: Icon(
                                  enableSpeakerphone
                                      ? Icons.volume_up
                                      : Icons.volume_off,
                                  color: Colors.white,
                                  size: 26),
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                      SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          _leaveChannel();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(Icons.call, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _durationToTime() {
    var minutes = callDuration ~/ 60;
    var secs = callDuration - minutes * 60;
    var minutesString = '00';
    if (minutes > 9) {
      minutesString = minutes.toString();
    } else {
      minutesString = '0$minutes';
    }
    var secsString = '00';
    if (secs < 10) {
      secsString = '0$secs';
    } else {
      secsString = secs.toString();
    }
    return '$minutesString:$secsString';
  }
}
