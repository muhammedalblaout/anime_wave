import 'package:anime_wave/features/animeSearch/data/models/anime_search_model.dart';

import '../../domin/entites/anime_search_page_response.dart';

class AnimeSearchPageModel extends AnimeSearchPageResponse {
  AnimeSearchPageModel(
      {required super.currentPage,
      required super.hasNextPage,
      required super.results});

  factory AnimeSearchPageModel.fromJson(Map<String, dynamic> map) {
    var results=List<AnimeSearchModel>.from(map["results"].map((x) {
      return AnimeSearchModel.fromJson(x);}
    )
    );
    return AnimeSearchPageModel(
      currentPage: map['currentPage'] as String,
      hasNextPage: map['hasNextPage'] as bool,
      results: results,
    );
  }

}
