import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsGridListPageCard extends StatefulWidget {
  final AnimeEpisode animeEpisode;

  const DetailsGridListPageCard({
    super.key,
    required this.animeEpisode,
  });

  @override
  State<DetailsGridListPageCard> createState() =>
      _details_list_page_CardState();
}

class _details_list_page_CardState extends State<DetailsGridListPageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 190,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppPallete.grard1,
                borderRadius:
                    BorderRadius.circular(15) // Adjust the radius as needed
                ),
            child: Image.network(
              widget.animeEpisode.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 130,
            alignment: Alignment.center,
            child: Text(
              widget.animeEpisode.title,
              style: GoogleFonts.poppins()
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
