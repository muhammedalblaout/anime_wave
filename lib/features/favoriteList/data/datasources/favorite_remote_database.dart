import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/my_anime_Info_model.dart';

abstract interface class FavoriteListDataSources {
  Future<List<MyAnimeInfoModel>> getFavoriteList(String user_id);


}
class FavoriteListDataSourcesImp implements FavoriteListDataSources{
  final SupabaseClient supabaseClient;

  FavoriteListDataSourcesImp(this.supabaseClient);
  
  @override
  Future<List<MyAnimeInfoModel>> getFavoriteList(String user_id) async {
    try {
      final infoData = await supabaseClient
          .from("myanimelist")
          .select("")
          .eq("user_id", user_id).eq("favorite", true);
      print(infoData);

      var info = List<MyAnimeInfoModel>.from(infoData.map((x) {
        return MyAnimeInfoModel.fromJson(x);
      }));

      return info;
    } on PostgrestException catch (e) {
      throw ServerExcepiton(e.message);
    } on ServerExcepiton catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }
  
}
