import 'package:anime_wave/features/animeInfo/domin/entites/anime_info_episode.dart';

class AnimeInfo{
  final String id;
  final String title;
  final String url;
  final List<String> genres;
  final int totalEpisodes;
  final String image;
  final String releaseDate;
  final String description;
  final String subOrDub;
  final String type;
  final String status;
  final List<String> otherName;
  final List<AnimeInfoEpisode> episodes;

  const AnimeInfo({
    required this.id,
    required this.title,
    required this.url,
    required this.genres,
    required this.totalEpisodes,
    required this.image,
    required this.releaseDate,
    required this.description,
    required this.subOrDub,
    required this.type,
    required this.status,
    required this.otherName,
    required this.episodes,
  });

  AnimeInfo copyWith({
    String? id,
    String? title,
    String? url,
    List<String>? genres,
    int? totalEpisodes,
    String? image,
    String? releaseDate,
    String? description,
    String? subOrDub,
    String? type,
    String? status,
    List<String>? otherName,
    List<AnimeInfoEpisode>? episodes,
  }) {
    return AnimeInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      genres: genres ?? this.genres,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      image: image ?? this.image,
      releaseDate: releaseDate ?? this.releaseDate,
      description: description ?? this.description,
      subOrDub: subOrDub ?? this.subOrDub,
      type: type ?? this.type,
      status: status ?? this.status,
      otherName: otherName ?? this.otherName,
      episodes: episodes ?? this.episodes,
    );
  }
}