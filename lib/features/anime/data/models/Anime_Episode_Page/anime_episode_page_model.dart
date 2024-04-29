import 'package:anime_wave/features/anime/domin/entites/anime_episode_page.dart';

import 'anime_episode_model.dart';

class AnimeEpisodePageModel extends AnimeEpisodePage{
  AnimeEpisodePageModel({
    required super.currentPage,
    required super.hasNextPage,
    required super.results});
  factory AnimeEpisodePageModel.fromJson(Map<String, dynamic> map) {
    var episodes=List<AnimeEpisodeModel>.from(map["results"].map((x) {
      return AnimeEpisodeModel.fromJson(x);}
    )
    );
    return AnimeEpisodePageModel(
      currentPage: map['currentPage'] as String,
      hasNextPage: map['hasNextPage'] as bool,
      results: episodes,
    );
  }

  }

