import 'package:anime_wave/features/animeSearch/domin/entites/anime_search.dart';

class AnimeSearchPageResponse{
  final String currentPage;
  final bool hasNextPage;
  final List<AnimeSearch>results;

   AnimeSearchPageResponse({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });


}