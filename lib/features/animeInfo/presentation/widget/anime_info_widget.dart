import 'package:anime_wave/features/animeInfo/presentation/widget/rich_info_text.dart';
import 'package:flutter/cupertino.dart';

import '../../domin/entites/anime_info.dart';

class AnimeInfoWidget extends StatelessWidget {
  final AnimeInfo animeInfo;
  const AnimeInfoWidget({super.key, required this.animeInfo});

  @override
  Widget build(BuildContext context) {
    return     Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 134,
          height: 194,
          child: Image.network(
            animeInfo.image,
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
              RichTextInfo("Release Date: ",
                  animeInfo.releaseDate),
              RichTextInfo(
                  "Type: ", animeInfo.type),
              RichTextInfo(
                  "Status: ", animeInfo.status),
              RichTextInfo("Sub OR Dub: ",
                  animeInfo.subOrDub),
              RichTextInfo("Genres: ",
                  animeInfo.genres.join(","))
            ],
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.start,
          ),
        )
      ],
    );
  }
}
