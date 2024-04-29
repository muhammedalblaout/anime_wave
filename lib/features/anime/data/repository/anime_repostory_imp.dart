import 'package:anime_wave/core/error/exceptions.dart';
import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/anime/data/datasources/RemoteDataSources.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode_page.dart';
import 'package:anime_wave/features/anime/domin/entites/category.dart';
import 'package:fpdart/fpdart.dart';
import '../../domin/repository/anime_repository.dart';
import '../models/promo/promo_model.dart';

class AnimeRepositoryImp implements AnimeRepository {
  RemoteDataSources remoteDataSources;

  AnimeRepositoryImp(this.remoteDataSources);

  @override
  Future<Either<Failures ,AnimeEpisodePage>> GetNewEpisode(String pagenum) async{
    return _getAnimeResults(() async => await remoteDataSources.getNewEpisodes( pagenum));

  }

  @override
  Future<Either<Failures, AnimeEpisodePage>> GetTopAiring(String pagenum)async {
    return _getAnimeResults(() async => await remoteDataSources.getTopAiring( pagenum));
  }
  Future<Either<Failures, AnimeEpisodePage>> _getAnimeResults(Future<AnimeEpisodePage> Function() fn)async{
    try {
      final response = await fn();
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }

  @override
  Future<Either<Failures, List<PromoModel>>> GetPromos() async {
    try {
      final response = await remoteDataSources.getPromo();
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }

  @override
  Future<Either<Failures, List<Category>>> getCategory() async {
    try {
      final response = await remoteDataSources.GetGategory();
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }

  @override
  Future<Either<Failures, AnimeEpisodePage>> getCategoryPage(String category, String page) async {
    try {
      final response = await remoteDataSources.getCategoryAnime(category, page);
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }

}

