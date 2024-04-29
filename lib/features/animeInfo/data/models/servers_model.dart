import '../../domin/entites/servers.dart';

class ServersModel extends Servers{
  ServersModel({required super.url,
    required super.isM3U8,
    required super.quality});
  factory ServersModel.fromJson(Map<String, dynamic> map) {

    return ServersModel(
      url: map['url'] as String,
      isM3U8: map['isM3U8'] as bool,
      quality: map['quality'] as String,
    );
  }

}