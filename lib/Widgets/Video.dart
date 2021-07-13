import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';
import 'package:videos_player/model/control.model.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/constants.dart';


import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: Videoplayer(),
          );
        },
      ),
    );
  }
}


class Videoplayer extends StatefulWidget {
  Videoplayer({Key key, this.title=''}) : super(key: key);
  final String title;

  @override
  _VideoplayerState createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: "Elephant Dream",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: true,
              )),
          new NetworkVideo(
              id: "3",
              name: "Big Buck Bunny",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
              videoControl: new NetworkVideoControl(autoPlay: true)),
          new NetworkVideo(
              id: "4",
              name: "For Bigger Blazes",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
          new NetworkVideo(
              id: "5",
              name: "For Bigger Escape",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"),
          new NetworkVideo(
              id: "6",
              name: "For Bigger Fun",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg"),
          new NetworkVideo(
              id: "7",
              name: "For Bigger Joyrides",
              videoUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
              thumbnailUrl:
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg"),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}