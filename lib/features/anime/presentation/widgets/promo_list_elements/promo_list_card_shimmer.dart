import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/presentation/widgets/youtube_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domin/entites/promo.dart';

class PromoListCardShimmer extends StatefulWidget {

  const PromoListCardShimmer({super.key});

  @override
  State<PromoListCardShimmer> createState() => _PromoListCardShimmerState();
}

class _PromoListCardShimmerState extends State<PromoListCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 300,
      height: 118,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppPallete.grard1,
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropsShadow,
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
          borderRadius: BorderRadius.circular(15)
          ),
      child: Stack(fit: StackFit.expand, children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(width: 250,
            height: 10,
            clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)

                )
                ),
                Container(width: 100,
                    height: 5,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)

                    )
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        )
      ]),
    );
  }
}
