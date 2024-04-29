
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info_episode.dart';

class AnimeInfoEpisodeModel extends AnimeInfoEpisode{

  AnimeInfoEpisodeModel({required super.id, required super.number});

  factory AnimeInfoEpisodeModel.fromJson(Map<String, dynamic> map) {
    return AnimeInfoEpisodeModel(
      id: map['id'] as String,
      number: map['number'] as int,
    );
  }
}