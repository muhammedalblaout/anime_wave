import 'package:fpdart/fpdart.dart';

import '../../../../core/entites/my_anime_Info.dart';
import '../../../../core/error/failures.dart';

abstract interface class FavoriteListRepository{
  Future<Either<Failures,List<MyAnimeInfo>>> getFavoriteList(String user_id);

}