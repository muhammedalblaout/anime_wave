import '../../../domin/entites/anime_episode.dart';

class AnimeCategoryModel extends AnimeEpisode {
  AnimeCategoryModel(
      {required super.id,
      required super.title,
      required super.image,
      required super.url,
      required super.genres,
      required super.episodeId,
      required super.episodeNumber});

  factory AnimeCategoryModel.fromJson(Map<String, dynamic> map) {

    return AnimeCategoryModel(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
      genres:List<String>.from(map['genres'] ?? []),
      episodeId: "",
      episodeNumber: 0
    );
  }
  AnimeCategoryModel copyWith({
    String? id,
    String? title,
    String? image,
    String? url,
    List<String>? genres,
    String? episodeId,
    num? episodeNumber,
  }) {
    return AnimeCategoryModel(
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
