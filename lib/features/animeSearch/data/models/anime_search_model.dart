import 'package:anime_wave/features/animeSearch/domin/entites/anime_search.dart';

class AnimeSearchModel extends AnimeSearch {
  AnimeSearchModel(
      {required super.id,
      required super.title,
      required super.url,
      required super.image,
      required super.releaseDate,
      required super.subOrDub});

  factory AnimeSearchModel.fromJson(Map<String, dynamic> map) {
      return AnimeSearchModel(
          id: map['id'] as String,
          title: map['title'] as String,
          url: map['url'] as String,
          image: map['image'] as String,
          releaseDate: map['releaseDate'] as String,
          subOrDub: map['subOrDub'] as String,
      );
  }

}
