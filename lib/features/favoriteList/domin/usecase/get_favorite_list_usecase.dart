import 'package:anime_wave/features/favoriteList/domin/repository/favorite_list_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/my_anime_Info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetFavoriteListUsecase implements Usecase<List<MyAnimeInfo>,FavoriteListParams>{
  FavoriteListRepository favoriteListRepository;

  GetFavoriteListUsecase(this.favoriteListRepository);

  @override
  Future<Either<Failures, List<MyAnimeInfo>>> call(FavoriteListParams params) async {
    return await favoriteListRepository.getFavoriteList(params.user_id);
  }

}
class FavoriteListParams{
  final String user_id;

  const FavoriteListParams({
    required this.user_id,
  });
}