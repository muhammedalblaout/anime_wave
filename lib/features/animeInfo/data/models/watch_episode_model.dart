import 'package:anime_wave/features/animeInfo/data/models/servers_model.dart';

import '../../domin/entites/watch_episode.dart';

class WatchEpisodeModel extends WatchEpisode{
  WatchEpisodeModel({required super.Referer,
    required super.servers,
    required super.download});
  factory WatchEpisodeModel.froJson(Map<String, dynamic> map) {
    var Servers=List<ServersModel>.from(map["sources"].map((x) {return ServersModel.fromJson(x);}));
    return WatchEpisodeModel(
      Referer: map["headers"]['Referer'] as String,
      servers: Servers,
      download: map['download'] as String,
    );
  }

}