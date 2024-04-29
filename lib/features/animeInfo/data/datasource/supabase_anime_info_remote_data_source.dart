import 'package:anime_wave/core/models/my_anime_Info_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../models/anime_info_model.dart';

abstract interface class SubabaseAnimeInfoDataSources {
  Future<MyAnimeInfoModel> getMyAnimeInfo(String user_id, String Anime_id);

  Future<MyAnimeInfoModel> InsertMyAnimeInfo(MyAnimeInfoModel myAnimeInfoModel);

  Future<MyAnimeInfoModel> updateMyAnimeInfo(MyAnimeInfoModel myAnimeInfoModel);
}

class SubabaseAnimeInfoDataSourcesImp implements SubabaseAnimeInfoDataSources {
  final SupabaseClient supabaseClient;

  SubabaseAnimeInfoDataSourcesImp(this.supabaseClient);

  @override
  Future<MyAnimeInfoModel> InsertMyAnimeInfo(
      MyAnimeInfoModel myAnimeInfoModel) async {
    try {
      final infoData = await supabaseClient
          .from("myanimelist")
          .insert(myAnimeInfoModel.toJson())
          .select();

      var info = List<MyAnimeInfoModel>.from(infoData.map((x) {
        return MyAnimeInfoModel.fromJson(x);
      }));
      if (info.isEmpty) {
        throw ServerExcepiton("something wrong happened");
      }
      return info.first;
    } on PostgrestException catch (e) {
      throw ServerExcepiton(e.message);
    } on ServerExcepiton catch (e) {
      throw ServerExcepiton(e.toString());
    } on Exception catch (e) {
      throw ServerExcepiton(e.toString());
    }

    throw UnimplementedError();
  }

  @override
  Future<MyAnimeInfoModel> getMyAnimeInfo(
      String user_id, String anime_id) async {
    try {
      final infoData = await supabaseClient
          .from("myanimelist")
          .select("")
          .eq("user_id", user_id)
          .eq("anime_id", anime_id);
      print(infoData);

      var info = List<MyAnimeInfoModel>.from(infoData.map((x) {
        return MyAnimeInfoModel.fromJson(x);
      }));
      if (info.isEmpty) {
        throw EmptyExcepiton(true);
      }
      return info.first;
    } on PostgrestException catch (e) {
      throw ServerExcepiton(e.message);
    } on ServerExcepiton catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }

  @override
  Future<MyAnimeInfoModel> updateMyAnimeInfo(
      MyAnimeInfoModel myAnimeInfoModel) async {
    try {
      final infoData = await supabaseClient
          .from("myanimelist")
          .update(myAnimeInfoModel.toJson())
          .match({"anime_id": myAnimeInfoModel.Anime_id,
        "user_id":myAnimeInfoModel.User_id}).select();

      var info = List<MyAnimeInfoModel>.from(infoData.map((x) {
        return MyAnimeInfoModel.fromJson(x);
      }));
      if (info.isEmpty) {
        throw ServerExcepiton("something wrong happened");
      }
      return info.first;
    } on PostgrestException catch (e) {
      throw ServerExcepiton(e.message);
    } on ServerExcepiton catch (e) {
      throw ServerExcepiton(e.toString());
    } on Exception catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }
}
