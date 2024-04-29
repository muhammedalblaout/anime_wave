import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/anime/domin/entites/category.dart';
import 'package:anime_wave/features/anime/domin/entites/promo.dart';
import 'package:fpdart/fpdart.dart';

import '../entites/anime_episode_page.dart';

abstract interface class AnimeRepository{
  Future<Either<Failures,AnimeEpisodePage>> GetNewEpisode(String pagenum);
  Future<Either<Failures,AnimeEpisodePage>> GetTopAiring(String pagenum);
  Future<Either<Failures,List<Promo>>> GetPromos();
  Future<Either<Failures,List<Category>>> getCategory();
  Future<Either<Failures,AnimeEpisodePage>> getCategoryPage(String category , String page);





}