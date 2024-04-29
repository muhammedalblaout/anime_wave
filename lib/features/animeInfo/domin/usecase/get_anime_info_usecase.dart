import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:fpdart/src/either.dart';

import '../repository/anime_info_repository.dart';

class GetAnimeInfoUsecase implements Usecase<AnimeInfo,InfoParams>{
  AnimeInfoRepository animeInfoRepository;

  GetAnimeInfoUsecase(this.animeInfoRepository);

  @override
  Future<Either<Failures, AnimeInfo>> call(InfoParams params) async {
    return await animeInfoRepository.GetAnimeInfo(params.id);
  }

}

class InfoParams{
  final String id;

  const InfoParams({
    required this.id,
  });

}