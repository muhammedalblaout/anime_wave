import 'package:anime_wave/features/animeInfo/data/models/anime_info_model.dart';
import 'package:anime_wave/features/animeInfo/data/models/watch_episode_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/commen/constant.dart';
import '../../../../core/error/exceptions.dart';

abstract interface class AnimeInfoRemoteDataSources{
  Future<AnimeInfoModel> getAnimeInfo(String id);
  Future<WatchEpisodeModel> getAnimeEpisodeSevers(String id);


}

class AnimeInfoRemoteDataSourcesImp implements AnimeInfoRemoteDataSources{
  final Dio dio;

  AnimeInfoRemoteDataSourcesImp(this.dio);

  @override
  Future<AnimeInfoModel> getAnimeInfo(String id) async{
    try {
      final response =  await dio.get("${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.Info}${id}" );
      return  AnimeInfoModel.fromJson(response.data);

    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }
  }

  @override
  Future<WatchEpisodeModel> getAnimeEpisodeSevers(String id) async {
    try {
      final response = await dio.get(
          "${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.Watch}${id}");
      return WatchEpisodeModel.froJson((response.data));
    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }
  }

}