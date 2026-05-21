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

class VideoCallArguments {
  final String rtcToken;
  final String consultationBookingId;
  final String userId;
  final String doctorImage;
  final String doctorName;

  VideoCallArguments(this.rtcToken, this.consultationBookingId, this.userId,
      this.doctorImage, this.doctorName);
}

class VideoCallScreen extends StatefulWidget {
  static final String routName = '/video_call';

  final VideoCallArguments arguments;

  VideoCallScreen({required this.arguments});

  @override
  VideoCallScreenState createState() => VideoCallScreenState();
}

class VideoCallScreenState extends State<VideoCallScreen> {
  late final RtcEngine _engine;
  bool isJoined = false, switchCamera = true, switchRender = true;
  List<int> remoteUid = [];
  bool openMicrophone = true;
  bool enableCamera = true;
  bool isDoctorShowVideo = true;

  @override
  void initState() {
    super.initState();
    this._initEngine();
  }

  @override
  void dispose() {
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
    _addListeners();

    await _engine.enableVideo();
    await _engine.startPreview();
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
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          debugPrint("remote user $uid joined");
          print('userJoined  ${uid} ${elapsed}');
          setState(() {
            remoteUid.add(uid);
          });
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
          setState(() {
            remoteUid.removeWhere((element) => element == uid);
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
        onRemoteVideoStats: (connection, stats) {
          //      if (stats == RemoteVideoStats .) {
          //   setState(() {
          //     isDoctorShowVideo = false;
          //   });
          // } else if (stats == VideoRemoteState.Decoding) {
          //   setState(() {
          //     isDoctorShowViˀˀˀdeo = true;
          //   });
          // }
        },
      ),
    );

    // _engine.setEventHandler(
    //     RtcEngineEventHandler(joinChannelSuccess: (channel, uid, elapsed) {
    //   print('joinChannelSuccess ${channel} ${uid} ${elapsed}');
    // }, userJoined: (uid, elapsed) {
    //   print('userJoined  ${uid} ${elapsed}');
    //   setState(() {
    //     remoteUid.add(uid);
    //   });
    // }, userOffline: (uid, reason) {
    //   print('userOffline  ${uid} ${reason}');
    //   setState(() {
    //     remoteUid.removeWhere((element) => element == uid);
    //   });
    // }, leaveChannel: (stats) {
    //   print('leaveChannel ${stats.toJson()}');
    //   setState(() {
    //     remoteUid.clear();
    //   });
    // }, remoteVideoStateChanged: (uid, state, reason, elapsed) {

    // }));
  }

  _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }
    await _engine.joinChannelWithUserAccount(
        token: widget.arguments.rtcToken,
        channelId: widget.arguments.consultationBookingId,
        userAccount: widget.arguments.userId);
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
  }

  _switchCamera() {
    _engine.enableLocalVideo(!enableCamera).then((value) {
      setState(() {
        enableCamera = !enableCamera;
      });
    }).catchError((err) {
      print('enableCamera $err');
    });
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<NotificationBloc, NotificationState>(
          bloc: GetIt.I.get<NotificationBloc>(),
          listener: (ctx, state) {
            if (state.notifications.last.title == 'Video Call') {
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

                // TODO confirm this use of channel id
                // isDoctorShowVideo && remoteUid.isNotEmpty
                //     ? RtcRemoteView(
                //         uid: remoteUid.first,
                //         channelId: widget.arguments.consultationBookingId,
                //       )
                //     : SizedBox.shrink(),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //       width: 120,
                //       height: 120,
                //       child: enableCamera
                //           ? RtcLocalView.SurfaceView()
                //           : SizedBox.shrink()),
                // ),
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
                              _switchCamera();
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
                                  enableCamera
                                      ? Icons.videocam
                                      : Icons.videocam_off,
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
}
