import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Video extends StatefulWidget {
   final VideoPlayerController  videoPlayerController;
   final bool loop;
    Video({required this.videoPlayerController,required this.loop,Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
   
   late ChewieController  _chewieController; 
   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(videoPlayerController: widget.videoPlayerController,
    looping: widget.loop,
    aspectRatio: 16/9,
    autoInitialize: true
    );
  }




  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController,);
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Video(
        videoPlayerController: VideoPlayerController.network('https://drive.google.com/file/d/1wcbC3xkiLxXPlIkhngVZGbcYKw-GvegZ/view'),
        loop: false,
      ),
    );
  }
}