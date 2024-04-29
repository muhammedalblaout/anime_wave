import 'package:anime_wave/core/entites/my_anime_Info.dart';

class MyAnimeInfoModel extends MyAnimeInfo {
  MyAnimeInfoModel(
      {required super.isFaverite,
      required super.last,
      required super.User_id,
      required super.Anime_id,
      required super.Image,
        required super.name});

  factory MyAnimeInfoModel.fromJson(Map<String, dynamic> map) {
    return MyAnimeInfoModel(
      isFaverite: map['favorite'] as bool,
      last: map['last_episode'] as int,
      Image: map['image'] as String,
      Anime_id: map['anime_id'] as String,
      User_id: map['user_id'] as String,
      name: map['name'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite': this.isFaverite,
      'last_episode': this.last,
      'image':this.Image,
      'anime_id':this.Anime_id,
      'user_id':this.User_id,
      'name':this.name



    };
  }
}
