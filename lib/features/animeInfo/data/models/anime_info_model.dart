
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';

import 'anime_info_episode_model.dart';

class AnimeInfoModel extends AnimeInfo {
  AnimeInfoModel({required super.id, required super.title, required super.url, required super.genres, required super.totalEpisodes, required super.image, required super.releaseDate, required super.description, required super.subOrDub, required super.type, required super.status, required super.otherName, required super.episodes});

  factory AnimeInfoModel.fromJson(Map<String, dynamic> map) {
    var episodes=List<AnimeInfoEpisodeModel>.from(map["episodes"].map((x) {
      return AnimeInfoEpisodeModel.fromJson(x);}
    )
    );
    List<String> otherName=map['otherName']!=""?map['otherName'].toString().trim().split(","):[" "];

    return AnimeInfoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      genres: List<String>.from(map['genres'] ?? []),
      totalEpisodes: map['totalEpisodes'] as int,
      image: map['image'] as String,
      releaseDate: map['releaseDate'] as String,
      description: map['description'] as String,
      subOrDub: map['subOrDub'] as String,
      type: map['type'] as String,
      status: map['status'] as String,
      otherName: otherName,
      episodes:episodes,
    );
  }
}
