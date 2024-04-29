import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/animeInfo/data/datasource/supabase_anime_info_remote_data_source.dart';
import 'package:anime_wave/core/models/my_anime_Info_model.dart';

import 'package:anime_wave/core/entites/my_anime_Info.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../domin/repository/supabase_info_repository.dart';

class SupabaseInfoRepositoryImp implements SupabaseInfoRepository {
  SubabaseAnimeInfoDataSources supabaseAnimeInfoDataSources;

  SupabaseInfoRepositoryImp(this.supabaseAnimeInfoDataSources);

  @override
  Future<Either<Failures, Either<Empty, MyAnimeInfoModel>>> getMyAnimeInfo(
      String user_id, String anime_id) async {
    try {
      final response = await supabaseAnimeInfoDataSources.getMyAnimeInfo(
          user_id, anime_id);
      return Right(Right(response));
    }
    on EmptyExcepiton catch (e) {
      return Right(Left(Empty(true)));
    }
    on ServerExcepiton catch (e) {
      return Left(Failures(e.massage));
    }
  }



  @override
  Future<Either<Failures, MyAnimeInfoModel>> insertMyAnimeInfo(MyAnimeInfo myAnimeInfo) async {
    try {
      MyAnimeInfoModel myAnimeInfoModel = MyAnimeInfoModel(
          isFaverite: myAnimeInfo.isFaverite,
          last: myAnimeInfo.last,
          User_id: myAnimeInfo.User_id,
          Anime_id: myAnimeInfo.Anime_id,
          Image: myAnimeInfo.Image,
        name: myAnimeInfo.name
      );

      final response = await supabaseAnimeInfoDataSources.InsertMyAnimeInfo(
          myAnimeInfoModel);
      return Right(response);
    }
    on ServerExcepiton catch (e) {
      return Left(Failures(e.massage));
    }
  }

  @override
  Future<Either<Failures, MyAnimeInfo>> updateMyAnimeInfo(MyAnimeInfo myAnimeInfo) async {
    try {
      MyAnimeInfoModel myAnimeInfoModel = MyAnimeInfoModel(
          isFaverite: myAnimeInfo.isFaverite,
          last: myAnimeInfo.last,
          User_id: myAnimeInfo.User_id,
          Anime_id: myAnimeInfo.Anime_id,
          Image: myAnimeInfo.Image, name: myAnimeInfo.name);

      final response = await supabaseAnimeInfoDataSources.updateMyAnimeInfo(
          myAnimeInfoModel);
      return Right(response);
    }
    on ServerExcepiton catch (e) {
      return Left(Failures(e.massage));
    }
  }

}