import 'dart:ui';

import 'package:anime_wave/core/commen/widgets/VideoPlayerWidgets/video_button.dart';
import 'package:anime_wave/core/commen/widgets/VideoPlayerWidgets/video_slider.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCustom extends StatefulWidget {
  static route(String url, String title) => MaterialPageRoute(
      builder: (context) => VideoPlayerCustom(
            url: url,
            title: title,
          )
  );

  final String url;
  final String title;

  const VideoPlayerCustom({super.key, required this.url, required this.title});

  @override
  State<VideoPlayerCustom> createState() => _VideoPlayerCustom2();
}

class _VideoPlayerCustom2 extends State<VideoPlayerCustom> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
    videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: true,
        allowFullScreen: true,
        showControls: false);

    super.initState();
  }

  bool isPlaying = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            child: Container(child: Chewie(controller: chewieController)),
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          AppPallete.backgroundColor,
                          AppPallete.backgroundColor.withOpacity(0.6),
                          AppPallete.backgroundColor.withOpacity(0.1)
                        ],
                            stops: const [
                          0.2,
                          0.7,
                          1
                        ])),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppPallete.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: AppPallete.color2,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: screenWidth / 2,
                                  child: Text(
                                    widget.title,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VideoButton(
                          icon: Icons.replay_10,
                          ontap: () {
                            Duration currentPosition =
                                videoPlayerController.value.position;
                            Duration targetPosition =
                                currentPosition - const Duration(seconds: 10);
                            videoPlayerController.seekTo(targetPosition);
                          }),
                      VideoButton(
                          icon: isPlaying ? Icons.pause : Icons.play_arrow,
                          ontap: () {
                            setState(() {
                              if (isPlaying) {
                                videoPlayerController.pause();
                                isPlaying = false;
                              } else {
                                videoPlayerController.play();
                                isPlaying = true;
                              }
                            });
                          }),
                      VideoButton(
                          icon: Icons.forward_10,
                          ontap: () {
                            Duration currentPosition =
                                videoPlayerController.value.position;
                            Duration targetPosition =
                                currentPosition + const Duration(seconds: 10);
                            videoPlayerController.seekTo(targetPosition);
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppPallete
                              .videoSlider // Adjust the radius as needed
                          ),
                      width: screenWidth - (screenWidth * 0.1),
                      child: SmoothVideoProgress(
                          controller: videoPlayerController,
                          builder: (context, position, duration, _) =>
                              VideoProgressSlider(
                                position: position,
                                duration: duration,
                                controller: videoPlayerController,
                                swatch: AppPallete.color1,
                                isPlaying: isPlaying,
                              )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    chewieController.pause();
    videoPlayerController.pause();

    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
