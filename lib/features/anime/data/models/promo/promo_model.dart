import '../../../domin/entites/promo.dart';

class PromoModel extends Promo{
  PromoModel({required super.title, required super.url, required super.image, required super.animename});

  factory PromoModel.fromJson(Map<String, dynamic> map) {
    return PromoModel(
      title: map['title'] as String,
      url: map['trailer']['youtube_id'] as String,
      image: map['trailer']['images']["maximum_image_url"] as String,
      animename: map['entry']["title"] as String,

    );
  }

}