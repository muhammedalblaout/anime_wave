import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/animeSearch/domin/entites/anime_search_page_response.dart';
import 'package:anime_wave/features/animeSearch/domin/repository/anime_search_repository.dart';
import 'package:fpdart/src/either.dart';


class GetAnimeSearchUsecase implements Usecase<AnimeSearchPageResponse,SearchParams>{
  AnimeSearchRepository animeRepository;


  GetAnimeSearchUsecase(this.animeRepository);

  @override
  Future<Either<Failures, AnimeSearchPageResponse>> call(SearchParams params)async {
    final res= await animeRepository.GetAnimeSearch(params.Query,params.Page);
    return res;
  }

}
class SearchParams {
  final String Query;
  final String Page;

  const SearchParams({
    required this.Query,
    required this.Page,
  });

}