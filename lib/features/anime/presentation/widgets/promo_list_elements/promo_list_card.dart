import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/presentation/widgets/youtube_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domin/entites/promo.dart';

class PromoListCard extends StatefulWidget {
  final Promo promo;

  const PromoListCard({super.key, required this.promo});

  @override
  State<PromoListCard> createState() => _PromoListCardState();
}

class _PromoListCardState extends State<PromoListCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 118,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: AppPallete.grard1,
              boxShadow: [
                BoxShadow(
                  color: AppPallete.dropsShadow,
                  spreadRadius: 0.5,
                  blurRadius: 7,
                ),
              ],
              borderRadius:
                  BorderRadius.circular(15) // Adjust the radius as needed
              ),
          child: Stack(fit: StackFit.expand, children: [
            Image.network(
              widget.promo.image,
              fit: BoxFit.cover,
              width:300,
              height: 118,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppPallete.transparent,
                    AppPallete.backgroundColor.withOpacity(0.7)
                  ],
                      stops: [
                    0,
                    .7
                  ])),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                        width: 250,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.promo.animename,
                            style: GoogleFonts.poppins().copyWith(
                              color: AppPallete.color2,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    Text(
                      widget.promo.title,
                      style: GoogleFonts.poppins().copyWith(
                          color: AppPallete.color2,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ]),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return Center(
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: YoutubeViewer(
                        Video_id: widget.promo.url,
                      )));
            },
          );
        },
      ),
    );
  }
}
