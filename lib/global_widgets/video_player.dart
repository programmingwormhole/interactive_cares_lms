import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../utils/colors.dart';

class ChewieVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool autoPlay;
  final bool looping;
  final bool? hideBookmark;

  const ChewieVideoPlayer({
    super.key,
    required this.videoPlayerController,
    this.autoPlay = false,
    this.looping = false, this.hideBookmark,
  });

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      aspectRatio: 16 / 9,
      allowMuting: true,
      additionalOptions: widget.hideBookmark == true ? null : (context) {
        return [
          OptionItem(onTap: () {
            Duration currentDuration = _chewieController.videoPlayerController.value.position;
            print('Bookmark called on $currentDuration');
          }, iconData: Icons.book, title: 'Bookmark Current Time'),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Chewie(
            key: UniqueKey(),
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

}
