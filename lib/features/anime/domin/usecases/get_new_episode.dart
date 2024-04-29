import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/anime/domin/repository/anime_repository.dart';
import 'package:fpdart/src/either.dart';

import '../entites/anime_episode_page.dart';

class GetNewEpisodeUsecase implements Usecase<AnimeEpisodePage,PageParams>{
  AnimeRepository animeRepository;


  GetNewEpisodeUsecase(this.animeRepository);

  @override
  Future<Either<Failures, AnimeEpisodePage>> call(PageParams params) async {
    return await animeRepository.GetNewEpisode(params.pagenum);

  }
  


}
