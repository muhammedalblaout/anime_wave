import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/anime/domin/repository/anime_repository.dart';
import 'package:fpdart/src/either.dart';

import '../entites/anime_episode_page.dart';

class GetCategoryAnimeUsecase implements Usecase<AnimeEpisodePage,CategoryPageParams>{
  AnimeRepository animeRepository;


  GetCategoryAnimeUsecase(this.animeRepository);

  @override
  Future<Either<Failures, AnimeEpisodePage>> call(CategoryPageParams params) async {
    return await animeRepository.getCategoryPage(params.category, params.page);

  }
  


}
class CategoryPageParams{
  final String category;
  final String page;

  CategoryPageParams(this.page, this.category);
}
