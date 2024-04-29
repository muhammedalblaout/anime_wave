import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/watch_episode.dart';
import 'package:fpdart/src/either.dart';

import '../repository/anime_info_repository.dart';

class GetWatchServersUsecase implements Usecase<WatchEpisode,WatchParams>{
  AnimeInfoRepository animeInfoRepository;

  GetWatchServersUsecase(this.animeInfoRepository);

  @override
  Future<Either<Failures, WatchEpisode>> call(WatchParams params) async {
    return await animeInfoRepository.GetWatchServers(params.id);
  }

}

class WatchParams{
  final String id;

   WatchParams({
    required this.id,
  });

}