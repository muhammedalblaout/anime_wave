
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScrollViewCard extends StatelessWidget {

  final AnimeEpisode episode;
  const ScrollViewCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10,vertical:8),
      child: Column(
        children: [
          Container(
            width: 134,
            height: 191,
            clipBehavior: Clip.antiAlias,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15) ,
              color: AppPallete.grard1// Adjust the radius as needed
            ),
            child: Image.network(
              episode.image,
              fit: BoxFit.cover,
            ),

          ),
          Center(
            child: Container(width: 134,
                child: Text(episode.title,style: GoogleFonts.poppins().copyWith(),maxLines: 2,textAlign: TextAlign.center,)),
          )
        ],
      ),
    );
  }
}

