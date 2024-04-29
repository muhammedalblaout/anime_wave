import 'package:anime_wave/core/commen/widgets/convert_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/cupertino.dart';

import '../../../theme/app_pallete.dart';

class VideoProgressSlider extends StatelessWidget {
  const VideoProgressSlider({
    super.key,
    required this.position,
    required this.duration,
    required this.controller,
    required this.swatch, required this.isPlaying,
  });

  final Duration position;
  final Duration duration;
  final VideoPlayerController controller;
  final Color swatch;
  final bool isPlaying;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation;
    final max = duration.inMilliseconds.toDouble();
    final value = position.inMilliseconds.clamp(0, max).toDouble();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(isPlaying?Icons.play_circle:Icons.pause,color: AppPallete.color2,size:31,),
          SizedBox(width: 8,),

          Text(
            ConvertDuration(duration,position),
            style: GoogleFonts.poppins().copyWith(
                shadows: [Shadow(blurRadius: 5)],
                fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: Container(
              child: Slider(
                activeColor: AppPallete.color1,
                inactiveColor: AppPallete.color2.withOpacity(0.5),
                min: 0,
                max: max,
                value: value,
                onChanged: (value) =>
                    controller.seekTo(Duration(milliseconds: value.toInt())),
              ),
            ),

          ),
    SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed:(){
          if(isPortrait == Orientation.portrait){
            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

          }
          else{
            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

          }
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation:MaterialStateProperty.all(0)  ,
          backgroundColor:
          MaterialStateProperty.all<Color>(AppPallete.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child:  Icon(isPortrait == Orientation.portrait?Icons.fullscreen_outlined:Icons.fullscreen_exit,color:AppPallete.color2,),
      ),
    )
        ],
      ),
    );
  }
}
