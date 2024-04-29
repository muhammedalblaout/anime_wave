import 'package:anime_wave/features/anime/domin/entites/anime_episode_page.dart';
import 'anime_category_model.dart';


class AnimeCategoryPageModel extends AnimeEpisodePage {
  AnimeCategoryPageModel({
    required super.currentPage,
    required super.hasNextPage,
    required super.results});

  factory AnimeCategoryPageModel.fromJson(Map<String, dynamic> map) {
    var animes = List<AnimeCategoryModel>.from(map["results"].map((x) {
      return AnimeCategoryModel.fromJson(x);
    }
    )
    );
    return AnimeCategoryPageModel(
      currentPage: map['currentPage'] as String,
      hasNextPage: map['hasNextPage'] as bool,
      results: animes,
    );
  }
}
