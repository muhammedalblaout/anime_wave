import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info_episode.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/entites/my_anime_Info.dart';

Widget EpisodeGridCard({required AnimeInfoEpisode animeInfoEpisode,required VoidCallback onTap,required,required bool islastEpisode}) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      child: Container(
        width: 20,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: islastEpisode?AppPallete.color2:AppPallete.color1),
        // color of grid items
        child: Column(
          children: [
            Text(
              "Episode:",
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color:islastEpisode?AppPallete.color1: AppPallete.color2),
            ),
            Text(
              animeInfoEpisode.number.toString(),
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color:islastEpisode?AppPallete.color1: AppPallete.color2),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),onTap:onTap,
    ),
  );
}
