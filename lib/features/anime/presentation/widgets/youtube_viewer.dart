import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeViewer extends StatefulWidget {
  String Video_id;
   YoutubeViewer({super.key,required this.Video_id});

  @override
  State<YoutubeViewer> createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {

  late YoutubePlayerController _controller;
  @override
  void initState() {
    print(widget.Video_id);
    this._controller = YoutubePlayerController(
      initialVideoId: widget.Video_id,
      flags: YoutubePlayerFlags(
        autoPlay: true,

      ),
    );    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppPallete.color1,
        progressColors: const ProgressBarColors(
          playedColor: AppPallete.color1,
          handleColor: AppPallete.color1,
        ),

      ),
    );
  }
}
