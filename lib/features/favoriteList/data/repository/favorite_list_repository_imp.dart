import 'package:anime_wave/core/entites/my_anime_Info.dart';

import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/favoriteList/data/datasources/favorite_remote_database.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../domin/repository/favorite_list_repository.dart';

class FavoriteListRepositoryImp implements FavoriteListRepository{
  FavoriteListDataSources favoriteListDataSources;

  FavoriteListRepositoryImp(this.favoriteListDataSources);

  @override
  Future<Either<Failures, List<MyAnimeInfo>>> getFavoriteList(String user_id) async {
    try {
      final response = await favoriteListDataSources.getFavoriteList(user_id);
      return Right(response);
    }
    on ServerExcepiton catch (e) {
      return Left(Failures(e.massage));
    }
  }

}