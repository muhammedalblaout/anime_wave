import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/watch_episode.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract interface class AnimeInfoRepository{
  Future<Either<Failures,AnimeInfo>> GetAnimeInfo(String id);
  Future<Either<Failures,WatchEpisode>> GetWatchServers(String id);



}