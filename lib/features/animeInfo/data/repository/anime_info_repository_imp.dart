
import 'package:anime_wave/features/animeInfo/data/models/anime_info_model.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/watch_episode.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domin/repository/anime_info_repository.dart';
import '../datasource/anime_info_remote_data_source.dart';

class AnimeInfoRepositoryImp implements AnimeInfoRepository {
  AnimeInfoRemoteDataSources animeInfoRemoteDataSources;

  AnimeInfoRepositoryImp(this.animeInfoRemoteDataSources);

  @override
  Future<Either<Failures, AnimeInfo>> GetAnimeInfo(String id) async {
    try {
      final response = await  animeInfoRemoteDataSources.getAnimeInfo(id);
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }

  }

  @override
  Future<Either<Failures, WatchEpisode>> GetWatchServers(String id) async {
    try {
      final response = await  animeInfoRemoteDataSources.getAnimeEpisodeSevers(id);
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }

}
