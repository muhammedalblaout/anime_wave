import 'package:anime_wave/features/animeSearch/domin/entites/anime_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_pallete.dart';

class SearchCard extends StatefulWidget {
  final AnimeSearch animeSearch;

  const SearchCard({
    super.key,
    required this.animeSearch,
  });

  @override
  State<SearchCard> createState() => _SearchCardCardState();
}

class _SearchCardCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: 380,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppPallete.grard3,
          boxShadow: const [
            BoxShadow(
                blurRadius: 2.0,
                blurStyle: BlurStyle.normal,
                color: AppPallete.dropsShadow)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 105,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15) // Adjust the radius as needed
                  ),
              child: Image.network(
                widget.animeSearch.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              width: 200,
              child: Column(
                children: [
                  Text(
                    widget.animeSearch.title,
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.animeSearch.releaseDate,
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.animeSearch.subOrDub,
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
