import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/animeSearch/domin/entites/anime_search_page_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AnimeSearchRepository{
  Future<Either<Failures,AnimeSearchPageResponse>>GetAnimeSearch(String query, String page);
}