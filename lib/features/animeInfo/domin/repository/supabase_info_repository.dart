import 'package:anime_wave/core/entites/my_anime_Info.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract interface class SupabaseInfoRepository{
  Future<Either<Failures,Either<Empty,MyAnimeInfo>>> getMyAnimeInfo(String user_id,String anime_id);
  Future<Either<Failures,MyAnimeInfo>> insertMyAnimeInfo(MyAnimeInfo myAnimeInfo);
  Future<Either<Failures,MyAnimeInfo>> updateMyAnimeInfo(MyAnimeInfo myAnimeInfo);

}