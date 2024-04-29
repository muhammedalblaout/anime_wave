import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';

class AnimeEpisodeModel extends AnimeEpisode{
  AnimeEpisodeModel({required super.id,
    required super.title,
    required super.image,
    required super.url,
    required super.genres,
    required super.episodeId,
    required super.episodeNumber});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'image': this.image,
      'url': this.url,
      'genres': this.genres,
      'episodeId': this.episodeId,
      'episodeNumber': this.episodeNumber,
    };
  }

  factory AnimeEpisodeModel.fromJson(Map<String, dynamic> map) {

    return AnimeEpisodeModel(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
      genres:List<String>.from(map['genres'] ?? []),
      episodeId: map['episodeId'] as String,
      episodeNumber: map['episodeNumber'] as num,
    );
  }
  AnimeEpisode copyWith({
    String? id,
    String? title,
    String? image,
    String? url,
    List<String>? genres,
    String? episodeId,
    num? episodeNumber,
  }) {
    return AnimeEpisode(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      url: url ?? this.url,
      genres: genres ?? this.genres,
      episodeId: episodeId ?? this.episodeId,
      episodeNumber: episodeNumber ?? this.episodeNumber,
    );
  }

}