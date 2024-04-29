import 'package:dio/dio.dart';

import '../../../../core/commen/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/anime_search_page_model.dart';

abstract interface class SearchRemoteDateSource{
  Future<AnimeSearchPageModel> GetAnimeSearch(String query ,String page);
}
class SearchRemoteDataSourceImp implements SearchRemoteDateSource{

  final Dio dio;

  SearchRemoteDataSourceImp(this.dio);
  @override
  Future<AnimeSearchPageModel> GetAnimeSearch(String query, String page) async {
    try {
      print("${AppConst.ApiUrl}${AppConst.routes[0]}${query}?page=${page}");
      final response = await dio.get("${AppConst.ApiUrl}${AppConst.routes[0]}${query}?page=${page}");
      print(response.data);

      return  AnimeSearchPageModel.fromJson(response.data);

    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }
  }

}