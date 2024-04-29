import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class DetailsListPageCard extends StatefulWidget {
  final AnimeEpisode animeEpisode;

  const DetailsListPageCard( {super.key, required this.animeEpisode, });

  @override
  State<DetailsListPageCard> createState() => _details_list_page_CardState();
}

class _details_list_page_CardState extends State<DetailsListPageCard> {
 
  @override
  Widget build(BuildContext context) {
    return Container(height:180,
        margin:EdgeInsets.symmetric(vertical:10,horizontal: 20),
        width:380,
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color:AppPallete.grard3,
        boxShadow: const [BoxShadow(blurRadius:2.0,blurStyle: BlurStyle.normal,color: AppPallete.dropsShadow)]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 105,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
              ),
              child: Image.network(
                widget.animeEpisode.image,
                fit: BoxFit.cover,
              ),

            ),
            SizedBox(width:16,),
            Container(
              width: 200,
              child: Column(children: [
                Text(widget.animeEpisode.title,
                  style:GoogleFonts.poppins().copyWith(fontSize:16,fontWeight: FontWeight.w700),
                  maxLines:2,
                ),
                const SizedBox(height:6,)
                ,Text("Episode: ${widget.animeEpisode.episodeNumber.toString()}",
                  style:GoogleFonts.poppins().copyWith(fontSize:12,fontWeight: FontWeight.w700),
                  maxLines:2,
                ),
                const SizedBox(height:30,),
                widget.animeEpisode.genres.length==0?SizedBox():
                Text("Genres: ${widget.animeEpisode.genres.length>5?
                    widget.animeEpisode.genres.sublist(0,4).join("-"):
                widget.animeEpisode.genres.join("-")
                }",
                  style:GoogleFonts.poppins().copyWith(fontSize:12,fontWeight: FontWeight.w200),
                  maxLines:2,
                )




              ],crossAxisAlignment: CrossAxisAlignment.start,),
            )
          ],
        ),
      ),
    );
  }
}
