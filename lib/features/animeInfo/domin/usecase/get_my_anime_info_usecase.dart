import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/core/entites/my_anime_Info.dart';
import 'package:anime_wave/features/animeInfo/domin/repository/supabase_info_repository.dart';
import 'package:fpdart/src/either.dart';


class GetMyAnimeInfoUsecase implements Usecase<Either<Empty,MyAnimeInfo>,AnimeInfoParams>{
  SupabaseInfoRepository subabaseInfoRepository;

  GetMyAnimeInfoUsecase(this.subabaseInfoRepository);

  @override
  Future<Either<Failures, Either<Empty,MyAnimeInfo>>> call(AnimeInfoParams params) async {
    return await subabaseInfoRepository.getMyAnimeInfo(params.user_id,params.anime_id);
  }

}

class AnimeInfoParams{
  final String user_id;
  final String anime_id;

  const AnimeInfoParams({
    required this.user_id,
    required this.anime_id,
  });
}