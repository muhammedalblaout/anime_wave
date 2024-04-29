import 'dart:convert';

import 'package:anime_wave/core/commen/consts.dart';
import 'package:anime_wave/features/anime/data/models/category/anime_category_page_model.dart';
import 'package:anime_wave/features/anime/data/models/category/category_model.dart';
import 'package:anime_wave/features/anime/data/models/promo/promo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../../../core/error/exceptions.dart';
import '../models/Anime_Episode_Page/anime_episode_page_model.dart';

abstract interface class RemoteDataSources{
  Future<AnimeEpisodePageModel> getNewEpisodes(String pagenum);
  Future<AnimeEpisodePageModel> getTopAiring(String pagenum);
  Future<List<PromoModel>> getPromo();
  Future<List<CategoryModel>> GetGategory();
  
  Future<AnimeCategoryPageModel> getCategoryAnime(String category ,String page);








}
class RemoteDataSourcesImp implements RemoteDataSources{
  final Dio dio;

  RemoteDataSourcesImp(this.dio);

  @override
  Future<AnimeEpisodePageModel> getNewEpisodes(String pagenum) async {
     return _getAnimeEpisodeResults(()async  => await dio.get("${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.NewEpisode}?page=${pagenum}") );
  }

  @override
  Future<AnimeEpisodePageModel> getTopAiring(String pagenum) async {
    return _getAnimeEpisodeResults(()async  => await dio.get("${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.TopAiring}?page=${pagenum}") );

  }


  Future<AnimeEpisodePageModel> _getAnimeEpisodeResults(Future<Response<dynamic>> Function() fn)async{
    try {
      final response = await fn();
      return  AnimeEpisodePageModel.fromJson(response.data);

    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
     catch(e){
     throw ServerExcepiton(e.toString());

    }
  }

  @override
  Future<List<PromoModel>> getPromo()async {
    try {
      final response = await dio.get("${AppConst.jikanUrl}${AppConst.jikroutes[0]}");

      var promos=List<PromoModel>.from(response.data["data"].map((x) {
        return PromoModel.fromJson(x);}));
      return promos;

    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }

  }

  @override
  Future<List<CategoryModel>> GetGategory() async {

    try {
      final String response = await rootBundle.loadString('assets/genre.json');
      final data = await json.decode(response);

      var categories=List<CategoryModel>.from(data.map((x) {
        return CategoryModel.fromJson(x);}
      ));
      return categories;
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }
  }

  @override
  Future<AnimeCategoryPageModel> getCategoryAnime(String category ,String page) async {

    try {
      final response = await dio.get("${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.category}${category}?page=${page}");
      print("${AppConst.ApiUrl}${AppConst.routes[0]}${AppConst.category}${category}?page=${page}");
      return AnimeCategoryPageModel.fromJson(response.data);

    }
    on DioException catch(e){
      throw ServerExcepiton(e.message!);
    }
    catch(e){
      throw ServerExcepiton(e.toString());

    }
  }



}