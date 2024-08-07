import 'package:flutter/material.dart';
import 'package:pro/answer_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeShortsPlayer extends StatefulWidget {
  const YoutubeShortsPlayer({super.key});

  @override
  State<YoutubeShortsPlayer> createState() => _YoutubeShortsPlayerState();
}

class _YoutubeShortsPlayerState extends State<YoutubeShortsPlayer> {
  final videoId = 'ZK6Fi0njEYk';
  late YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            loop: true,
            forceHD: true,
            controlsVisibleAtStart: false,
            disableDragSeek: true));

    super.initState();

    Future.delayed(const Duration(seconds: 37), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AnswerScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: YoutubePlayer(
        controller: controller,
        aspectRatio: 9 / 16,
      )),
    );
  }
}
